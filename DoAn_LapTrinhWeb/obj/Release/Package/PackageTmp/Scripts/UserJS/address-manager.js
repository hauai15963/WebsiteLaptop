﻿$(document).ready(function () { $("#province").change(function () { $("#district").removeClass("cursor-disable"), $("#district").removeAttr("disabled"), $.get("/Account/GetDistrictsList", { province_id: $("#province").val() }, function (e) { $("#district").html("<option value>Quận/ Huyện</option>"), $.each(e, function (e, t) { $("#district").append("<option value='" + t.district_id + "'>" + t.type + " " + t.district_name + "</option>") }) }) }), $("#district").change(function () { $("#ward").removeClass("cursor-disable"), $("#ward").removeAttr("disabled"), $.get("/Account/GetWardsList", { district_id: $("#district").val() }, function (e) { $("#ward").html("<option value>Phường/ Xã</option>"), $.each(e, function (e, t) { $("#ward").append("<option value='" + t.ward_id + "'>" + t.type + " " + t.ward_name + "</option>") }) }) }) }); var createmodal = $("#ModalCreate"); $("#popupcreateaddress").click(function () { $(".nice-select").remove(), createmodal.modal("show") }), $("#closemodal").click(function () { editModal.modal("hide") }), $("#closemodal1").click(function () { editModal.modal("hide") }), $("#closemodal4").click(function () { editModal2.modal("hide") }), $("#closemodal5").click(function () { editModal2.modal("hide") }), $("#closemodal3").click(function () { createmodal.modal("hide") }); var ide, SaveAddress = function () { var e = $("#address_name").val(), t = $("#address_phone").val(), i = $("#province").val(), n = $("#district").val(), o = $("#address_content").val(), d = $("#ward").val(); if ("" == e || "" == t || "" == i || "" == n || "" == d || "" == o) { return Swal.mixin({ toast: !0, position: "top-end", showConfirmButton: !1, timer: 2500, didOpen: e => { e.addEventListener("mouseenter", Swal.stopTimer), e.addEventListener("mouseleave", Swal.resumeTimer) } }).fire({ icon: "warning", title: "Nhập thông tin còn thiếu" }), !1 } if (t.length < 10 || t.length > 10) { return Swal.mixin({ toast: !0, position: "top-end", showConfirmButton: !1, timer: 2500, didOpen: e => { e.addEventListener("mouseenter", Swal.stopTimer), e.addEventListener("mouseleave", Swal.resumeTimer) } }).fire({ icon: "warning", title: "Số điện thoại phải đúng 10 chữ số" }), !1 } if (e.length > 20) { return Swal.mixin({ toast: !0, position: "top-end", showConfirmButton: !1, timer: 2500, didOpen: e => { e.addEventListener("mouseenter", Swal.stopTimer), e.addEventListener("mouseleave", Swal.resumeTimer) } }).fire({ icon: "warning", title: "Họ tên không quá 20 ký tự" }), !1 } if (o.length > 50) { return Swal.mixin({ toast: !0, position: "top-end", showConfirmButton: !1, timer: 2500, didOpen: e => { e.addEventListener("mouseenter", Swal.stopTimer), e.addEventListener("mouseleave", Swal.resumeTimer) } }).fire({ icon: "warning", title: "Địa chỉ cụ thể không quá 50 ký tự" }), !1 } var r = $("#create_address").serialize(); $.ajax({ type: "POST", url: "/Account/AddressCreate", data: r, success: function (e) { if (createmodal.modal("hide"), 1 == e) setTimeout(function () { window.location.reload() }, 1); else { Swal.mixin({ toast: !0, position: "top-end", showConfirmButton: !1, timer: 1e3, didOpen: e => { e.addEventListener("mouseenter", Swal.stopTimer), e.addEventListener("mouseleave", Swal.resumeTimer) } }).fire({ icon: "error", title: "Lỗi" }) } } }) }; $(document).ready(function () { $("#province_edit").change(function () { $("#district_edit").removeClass("cursor-disable"), $("#district_edit").removeAttr("disabled"), $.get("/Account/GetDistrictsList", { province_id: $("#province_edit").val() }, function (e) { $("#district_edit").html("<option value>Quận/ Huyện</option>"), $.each(e, function (e, t) { $("#district_edit").append("<option value='" + t.district_id + "'>" + t.type + " " + t.district_name + "</option>") }) }) }), $("#district_edit").change(function () { $("#ward_edit").removeClass("cursor-disable"), $("#ward_edit").removeAttr("disabled"), $.get("/Account/GetWardsList", { district_id: $("#district_edit").val() }, function (e) { $("#ward_edit").html("<option value>Phường/ Xã</option>"), $.each(e, function (e, t) { $("#ward_edit").append("<option value='" + t.ward_id + "'>" + t.type + " " + t.ward_name + "</option>") }) }) }) }); var editModal = $("#EditAddress"), EditAddress = function (e, t, i, n, o, d, r) { $(".nice-select").remove(), ide = e, $("#province_edit").val(n), $("#address_name_edit").val(t), $("#district_edit").val(o), $("#ward_edit").val(d), $("#address_content_edit").val(r), $("#address_phone_edit").val(i), editModal.modal("show") }; $("#confirmeditBtn").click(function () { var e = $("#province_edit").val(), t = $("#address_name_edit").val(), i = $("#district_edit").val(), n = $("#ward_edit").val(), o = $("#address_content_edit").val(), d = $("#address_phone_edit").val(); if ("" == e || "" == t || "" == i || "" == n || "" == o || "" == d) { return Swal.mixin({ toast: !0, position: "top", showConfirmButton: !1, timer: 1500, didOpen: e => { e.addEventListener("mouseenter", Swal.stopTimer), e.addEventListener("mouseleave", Swal.resumeTimer) } }).fire({ icon: "warning", title: "Hãy nhập đầy đủ thông tin" }), !1 } if (o.length > 50) { return Swal.mixin({ toast: !0, position: "top", showConfirmButton: !1, timer: 2e3, didOpen: e => { e.addEventListener("mouseenter", Swal.stopTimer), e.addEventListener("mouseleave", Swal.resumeTimer) } }).fire({ icon: "warning", title: "Địa chỉ cụ thể không quá 50 ký tự" }), $("#confirmeditBtn").attr("disabled"), !1 } if (d.length < 10 || d.length > 10) { return Swal.mixin({ toast: !0, position: "top", showConfirmButton: !1, timer: 2e3, didOpen: e => { e.addEventListener("mouseenter", Swal.stopTimer), e.addEventListener("mouseleave", Swal.resumeTimer) } }).fire({ icon: "warning", title: "Số điện thoại phải đúng 10 chữ số" }), !1 } if (t.length > 20) { return Swal.mixin({ toast: !0, position: "top", showConfirmButton: !1, timer: 2e3, didOpen: e => { e.addEventListener("mouseenter", Swal.stopTimer), e.addEventListener("mouseleave", Swal.resumeTimer) } }).fire({ icon: "warning", title: "Họ tên không quá 20 ký tự" }), !1 } $.ajax({ type: "post", url: "/Account/AddressEdit", contentType: "application/json; charset=utf-8", data: JSON.stringify({ id: ide, username: t, province_id: e, district_id: i, ward_id: n, address_content: o, phonenumber: d }), dataType: "json", success: function (e) { if (1 == e) { editModal.modal("hide"), Swal.mixin({ toast: !0, position: "top", showConfirmButton: !1, timer: 2e3, didOpen: e => { e.addEventListener("mouseenter", Swal.stopTimer), e.addEventListener("mouseleave", Swal.resumeTimer) } }).fire({ icon: "success", title: "Cập nhật thành công" }); var i = $("#province_edit").find(":selected"), n = $("#district_edit").find(":selected"), r = $("#ward_edit").find(":selected"); return $("#item-user-name_" + ide).text(t), $("#item-phone-number_" + ide).text(d), void $("#item-content_" + ide).text(o + ", " + r.text() + ", " + n.text() + ", " + i.text()) } return editModal.modal("hide"), Swal.mixin({ toast: !0, position: "top", showConfirmButton: !1, timer: 2500, didOpen: e => { e.addEventListener("mouseenter", Swal.stopTimer), e.addEventListener("mouseleave", Swal.resumeTimer) } }).fire({ icon: "error", title: "Lối! không tìm thấy ID" }), !1 }, error: function () { Swal.mixin({ toast: !0, position: "top", showConfirmButton: !1, timer: 2500, didOpen: e => { e.addEventListener("mouseenter", Swal.stopTimer), e.addEventListener("mouseleave", Swal.resumeTimer) } }).fire({ icon: "warning", title: "Sửa thất bại" }) } }) }); var defaultID, defaultmodal = $("#defaultModal"), defaultConfirm = function (e) { defaultmodal.modal("show"), defaultID = e }; $("#cancle-defalt").click(function () { defaultmodal.modal("hide") }), $("#btn-default-submit").click(function () { $.ajax({ type: "POST", url: "/Account/DefaultAddress", contentType: "application/json; charset=utf-8", data: JSON.stringify({ id: defaultID }), dataType: "json", success: function (e) { if (1 == e) { Swal.mixin({ toast: !0, position: "top-end", showConfirmButton: !1, timer: 2e3, didOpen: e => { e.addEventListener("mouseenter", Swal.stopTimer), e.addEventListener("mouseleave", Swal.resumeTimer) } }).fire({ icon: "success", title: "Cập nhật địa chỉ mặc định thành công" }), defaultmodal.modal("hide") } else { defaultmodal.modal("hide"), Swal.mixin({ toast: !0, position: "top-end", showConfirmButton: !1, timer: 2e3, didOpen: e => { e.addEventListener("mouseenter", Swal.stopTimer), e.addEventListener("mouseleave", Swal.resumeTimer) } }).fire({ icon: "error", title: "Địa chỉ đang là mặc định!" }) } }, error: function () { Swal.mixin({ toast: !0, position: "top", showConfirmButton: !1, timer: 2500, didOpen: e => { e.addEventListener("mouseenter", Swal.stopTimer), e.addEventListener("mouseleave", Swal.resumeTimer) } }).fire({ icon: "error", title: "!Lỗi" }) } }) }); var idde, delmodal = $("#deleteModal"), deleteConfirm = function (e) { delmodal.modal("show"), idde = e }; $("#cancle_delete_address").click(function () { delmodal.modal("hide") }), $("#btndelete_address").click(function () { delmodal.modal("hide"), $.ajax({ type: "POST", url: "/Account/AddressDelete", contentType: "application/json; charset=utf-8", data: JSON.stringify({ id: idde }), dataType: "json", success: function (e) { if (1 == e) { $("#item_" + idde).remove(), Swal.mixin({ toast: !0, position: "top", showConfirmButton: !1, timer: 2e3, didOpen: e => { e.addEventListener("mouseenter", Swal.stopTimer), e.addEventListener("mouseleave", Swal.resumeTimer) } }).fire({ icon: "success", title: "Xóa thành công" }) } }, error: function () { Swal.mixin({ toast: !0, position: "top", showConfirmButton: !1, timer: 2500, didOpen: e => { e.addEventListener("mouseenter", Swal.stopTimer), e.addEventListener("mouseleave", Swal.resumeTimer) } }).fire({ icon: "error", title: "!Lỗi" }) } }) }), $("#save-order").click(function () { const e = $("#province").val(), t = $("#district").val(), i = $("#ward").val(), n = $("#user-name").val(), o = $("#phone-number").val(), d = $("#content").val(); if ("" == e || "" == t || "" == i || "" == n || "" == o || "" == d) { return Swal.mixin({ toast: !0, position: "top", showConfirmButton: !1, timer: 3e3, didOpen: e => { e.addEventListener("mouseenter", Swal.stopTimer), e.addEventListener("mouseleave", Swal.resumeTimer) } }).fire({ icon: "error", title: "Nhập thông tin còn thiếu" }), !1 } $("#save-order").attr("type", "submit") });