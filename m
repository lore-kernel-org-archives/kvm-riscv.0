Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D881FD461F
	for <kvm-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 05:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CVrvaD60Q8oi80tJyOGlbbeozyxoaUbIOoPtcoa0xDM=; b=SI9PWJ9MVWxVXd
	RpF70cwyM3sFnycYrk6/cQu2MmkvRMDQp4TiJ5pf81bPHbp5LoLtOwAEVhlzT+IrwdfEVlab/50KY
	YKTAvktZTOncXscmSwfK+75wzEFKaHSFS+jkvtZAhOp+IYKC8DlFhNs0xUzSb+oywnwS+xW2KLE92
	hYjimPaApGa+sD8Lu/TCR+pKLMhb2r4gurkfZA+kznOQ+8nszlol0v34rhuVe11lBN8W35ST6kVxF
	HiEq9BGz4OZiF/Xt0u4nuLddD6SRUsKTndlCWAN6je6wS7nu9JdqJffF8gMk9SVl6KpyDH5O9mJcj
	uPVjPnTHcpkQeLfefr8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvUDy-00000005RgI-3Gll;
	Thu, 26 Feb 2026 05:47:46 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvUDw-00000005Rfd-17Yq
	for kvm-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 05:47:45 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-679f6ee3fb0so5211eaf.2
        for <kvm-riscv@lists.infradead.org>; Wed, 25 Feb 2026 21:47:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772084863; cv=none;
        d=google.com; s=arc-20240605;
        b=ftIqh+QbMz1lzdjYMUZT5WCCoZSYF75o70W+pxNwO19glYdwCe3z8A3zSeO/NcZUDG
         mhOq8eM1R+Im9Sm9KJYTTexk/vf9WbrYfazMjsIB5EUS6ECzBJaAFbkAZ1z5FDWUtNOt
         Lo6RAvxo1avczEHO24bWqyQcPGA+tmF02UDRzpo8YUcSh9xdAqZx5pe5cJcZ2HFoTc64
         nsNi8kbv0xjSqX8RvTHr0Aa0Cc9LepMiqOmWHEimkxLx17FOckEGM7PZq9ehBBV9WWX+
         5WZR5mzn2WR07IRzPmjMvj6mhyWZrmWcOhyM8dvT55u1lZhOufz495jONc0M/jA7UcJ+
         rG9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b3GT5Na22u0rkZZPCLAOp9C1u+Nx1823EYWE29L6QxQ=;
        fh=bhgEQOEgXi8idjB0yevJF1t/hTFQ0DiQHOaD8Or9wGc=;
        b=JRD1MgHCExPLTV8GSflSP53FYDK3O6VPDRZedawizjrtH4yRn3NwhLNE5TEyGWekE/
         jFviiEjLTUEnaIBpR2EmWNekjurwYWwxKW447iSPLt0F8aULyTrSzOhO2yXs35ZBH4Q0
         vPOFbMTgXfd1ZFymjE0AcHo8/bmdtVepLw5sF4eaw+b3SLMW/SXCws92Y4IrzjLWiiVF
         JBVwR1GNePQWalfRJrZpnDzmUbOqhAEpMAZkkmU8dPOc9ggfD4VRj+I4+JTzGbSkBjwJ
         huuQy2sfdd6PL3U/BgIc91olEALRmRtpOrh2eJYuYEz03BJMpW8X/u6X0cuGtibgY/TZ
         rfvA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772084863; x=1772689663; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3GT5Na22u0rkZZPCLAOp9C1u+Nx1823EYWE29L6QxQ=;
        b=re6HHM5DV544NU77aouLhwCHVf0SbABUoNBivVU47eWnG7ygQ+g9L9vQv+AEDBVzpv
         Ve7QTxZWqpjhx7UzIt4Ltpqbt4H32Ic0rHjq8MgTGkHRk9OJgF3Tm19DzUpFc7bo31Y7
         qfVtsBZ229d4oqrHYuUMYAx2N04PrpcUoARUM89ZNODcsyJi6CPHY9/NpQahklKxTKda
         /zYGqSJbHm9td2FneKyWHx2Vxk32zlIINjaaUbohfPqS3e6EiwRUkpnl76QXeG0fIYmJ
         gIkm+ajOEB+62lO8fFzlS9YQRsN/1dB4ZT3LGjBVvi9IZIRMPAChEWQ/XTHtus81xt22
         h2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772084863; x=1772689663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b3GT5Na22u0rkZZPCLAOp9C1u+Nx1823EYWE29L6QxQ=;
        b=BGglv2wupjVNpqiGWWzvOYeFciP5JkQUD4VaOvQK679D6P214384wVcK0wyKYbiXy1
         2EKGzZi+OHOvcpSmZA/EGaKOfI07vT2fq+ZmEvvWUbQyXcGVLQ+gciaBVLCdYS2hCNsu
         lA6I3C1hN+Q14a995BuymSbUVffuXpyP2OQLjIivWuEJfnWQg5GP4yv+Qa7USLkdlwJ1
         zN0tlR4Jf5qrfS+k+RjM/sGZkYaNUgIGLvQzCsE5HQLXN3AEFnaEUe01JTLVX8cOi7k6
         bl7JX0VlO/ziRcuntqiF95OJmpKfw5aB3mqf6S7eqm4siSVqNoCZ5LZBvgMnQc5d+uZF
         e2ow==
X-Forwarded-Encrypted: i=1; AJvYcCVLK8Grk9DlrV3OZj1CkuKdu3hrX6QsLYBYIi0zLZEo+W1koPFUsvrHWuDCBF8Xamuf/haiL6i9bZo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzJO3hydUFJ+1eoDSAiHRSI7L24EiJ7IdI3Wy6816AZmZFu0diQ
	RN7G7ud7KsIKtm9Up8RzpaT/fLKgTNr4ELUZhglUiX2B4O6rrseZ50zzA+iWH6f6WtSj/TJnRtl
	ukNizQw4fNOoBxV4spP/Z13EXo/DOZd4vPfpNVCyWYg==
X-Gm-Gg: ATEYQzwRNoBt9kQNaoulOw5+NWE1SZcTLKVlQumlzCJgWlgPYq1w9jzNOn0yWseROaf
	tViDQcWnZkwx5sOVUsFtwvLa6mCW2lMXFAjqXWZtorUbGyjO2UgWSRrYfQ+6IQ81AlkksNeD8Vm
	n34Axpav3z51qVpZEjePMH6Sm4b47j0BkL4LfSf8NQX6FtOC2bV5zW2QNkRym4jws2vZDCgjMdg
	U2lWkQKSlTNqj4KjH3kzVo61gMBGSegQAFeXsQj2CyJv55ismHCN9Gy7Zsku1UWFuls3IT39nlK
	mg+M045YCWgErnfgAsweXtmvyTw5OVmz4wdfereFq4UwXmK7MYSstpVMenqMHlIN6mNi147L4cs
	N2iu6nZhT49lK0XhJBEu2AXwcOtw=
X-Received: by 2002:a05:6820:1892:b0:679:a5d2:569b with SMTP id
 006d021491bc7-679ef97d50bmr1284924eaf.40.1772084862848; Wed, 25 Feb 2026
 21:47:42 -0800 (PST)
MIME-Version: 1.0
References: <20260116095731.24555-1-lukas.gerlach@cispa.de>
In-Reply-To: <20260116095731.24555-1-lukas.gerlach@cispa.de>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 26 Feb 2026 11:17:31 +0530
X-Gm-Features: AaiRm50VNfj9kpGvvhZpT9bmuFIeIxzxQ2bB45ExZQGoqQfOYd839ZCCNnG0AHA
Message-ID: <CAAhSdy1g7pYoF5uXMx4L9zVkRHd8Fj2SMgsc3MS7sQkh74eELw@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: Fix Spectre-v1 in APLIC interrupt handling
To: Lukas Gerlach <lukas.gerlach@cispa.de>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	daniel.weber@cispa.de, marton.bognar@kuleuven.be, jo.vanbulck@kuleuven.be, 
	michael.schwarz@cispa.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_214744_310961_C885FBC8 
X-CRM114-Status: GOOD (  14.84  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKYW4gMTYsIDIwMjYgYXQgMzoyN+KAr1BNIEx1a2FzIEdlcmxhY2ggPGx1a2FzLmdl
cmxhY2hAY2lzcGEuZGU+IHdyb3RlOgo+Cj4gR3Vlc3RzIGNhbiBjb250cm9sIElSUSBpbmRpY2Vz
IHZpYSBNTUlPLiBTYW5pdGl6ZSB0aGVtIHdpdGgKPiBhcnJheV9pbmRleF9ub3NwZWMoKSB0byBw
cmV2ZW50IHNwZWN1bGF0aXZlIG91dC1vZi1ib3VuZHMgYWNjZXNzCj4gdG8gdGhlIGFwbGljLT5p
cnFzW10gYXJyYXkuCj4KPiBTaW1pbGFyIHRvIGFybTY0IGNvbW1pdCA0MWI4NzU5OWM3NDMgKCJL
Vk06IGFybS9hcm02NDogdmdpYzogZml4IHBvc3NpYmxlCj4gc3BlY3RyZS12MSBpbiB2Z2ljX2dl
dF9pcnEoKSIpIGFuZCB4ODYgY29tbWl0IDhjODY0MDVmNjA2YyAoIktWTTogeDg2Ogo+IFByb3Rl
Y3QgaW9hcGljX3JlYWRfaW5kaXJlY3QoKSBmcm9tIFNwZWN0cmUtdjEvTDFURiBhdHRhY2tzIiku
Cj4KPiBGaXhlczogNzQ5NjdhYTIwOGUyICgiUklTQy1WOiBLVk06IEFkZCBpbi1rZXJuZWwgZW11
bGF0aW9uIG9mIEFJQSBBUExJQyIpCj4gU2lnbmVkLW9mZi1ieTogTHVrYXMgR2VybGFjaCA8bHVr
YXMuZ2VybGFjaEBjaXNwYS5kZT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51
cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIGFzIGZpeCBmb3IgTGludXgtNy4wLXJjWAoK
UmVnYXJkcywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vYWlhX2FwbGljLmMgfCAyMyAr
KysrKysrKysrKystLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygr
KSwgMTEgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vYWlhX2Fw
bGljLmMgYi9hcmNoL3Jpc2N2L2t2bS9haWFfYXBsaWMuYwo+IGluZGV4IGY1OWQxYzBjOGM0My4u
YTJiODMxZTU3ZWNkIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jCj4g
KysrIGIvYXJjaC9yaXNjdi9rdm0vYWlhX2FwbGljLmMKPiBAQCAtMTAsNiArMTAsNyBAQAo+ICAj
aW5jbHVkZSA8bGludXgvaXJxY2hpcC9yaXNjdi1hcGxpYy5oPgo+ICAjaW5jbHVkZSA8bGludXgv
a3ZtX2hvc3QuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L21hdGguaD4KPiArI2luY2x1ZGUgPGxpbnV4
L25vc3BlYy5oPgo+ICAjaW5jbHVkZSA8bGludXgvc3BpbmxvY2suaD4KPiAgI2luY2x1ZGUgPGxp
bnV4L3N3YWIuaD4KPiAgI2luY2x1ZGUgPGt2bS9pb2Rldi5oPgo+IEBAIC00NSw3ICs0Niw3IEBA
IHN0YXRpYyB1MzIgYXBsaWNfcmVhZF9zb3VyY2VjZmcoc3RydWN0IGFwbGljICphcGxpYywgdTMy
IGlycSkKPgo+ICAgICAgICAgaWYgKCFpcnEgfHwgYXBsaWMtPm5yX2lycXMgPD0gaXJxKQo+ICAg
ICAgICAgICAgICAgICByZXR1cm4gMDsKPiAtICAgICAgIGlycWQgPSAmYXBsaWMtPmlycXNbaXJx
XTsKPiArICAgICAgIGlycWQgPSAmYXBsaWMtPmlycXNbYXJyYXlfaW5kZXhfbm9zcGVjKGlycSwg
YXBsaWMtPm5yX2lycXMpXTsKPgo+ICAgICAgICAgcmF3X3NwaW5fbG9ja19pcnFzYXZlKCZpcnFk
LT5sb2NrLCBmbGFncyk7Cj4gICAgICAgICByZXQgPSBpcnFkLT5zb3VyY2VjZmc7Cj4gQEAgLTYx
LDcgKzYyLDcgQEAgc3RhdGljIHZvaWQgYXBsaWNfd3JpdGVfc291cmNlY2ZnKHN0cnVjdCBhcGxp
YyAqYXBsaWMsIHUzMiBpcnEsIHUzMiB2YWwpCj4KPiAgICAgICAgIGlmICghaXJxIHx8IGFwbGlj
LT5ucl9pcnFzIDw9IGlycSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+IC0gICAgICAgaXJx
ZCA9ICZhcGxpYy0+aXJxc1tpcnFdOwo+ICsgICAgICAgaXJxZCA9ICZhcGxpYy0+aXJxc1thcnJh
eV9pbmRleF9ub3NwZWMoaXJxLCBhcGxpYy0+bnJfaXJxcyldOwo+Cj4gICAgICAgICBpZiAodmFs
ICYgQVBMSUNfU09VUkNFQ0ZHX0QpCj4gICAgICAgICAgICAgICAgIHZhbCA9IDA7Cj4gQEAgLTgx
LDcgKzgyLDcgQEAgc3RhdGljIHUzMiBhcGxpY19yZWFkX3RhcmdldChzdHJ1Y3QgYXBsaWMgKmFw
bGljLCB1MzIgaXJxKQo+Cj4gICAgICAgICBpZiAoIWlycSB8fCBhcGxpYy0+bnJfaXJxcyA8PSBp
cnEpCj4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+IC0gICAgICAgaXJxZCA9ICZhcGxpYy0+
aXJxc1tpcnFdOwo+ICsgICAgICAgaXJxZCA9ICZhcGxpYy0+aXJxc1thcnJheV9pbmRleF9ub3Nw
ZWMoaXJxLCBhcGxpYy0+bnJfaXJxcyldOwo+Cj4gICAgICAgICByYXdfc3Bpbl9sb2NrX2lycXNh
dmUoJmlycWQtPmxvY2ssIGZsYWdzKTsKPiAgICAgICAgIHJldCA9IGlycWQtPnRhcmdldDsKPiBA
QCAtOTcsNyArOTgsNyBAQCBzdGF0aWMgdm9pZCBhcGxpY193cml0ZV90YXJnZXQoc3RydWN0IGFw
bGljICphcGxpYywgdTMyIGlycSwgdTMyIHZhbCkKPgo+ICAgICAgICAgaWYgKCFpcnEgfHwgYXBs
aWMtPm5yX2lycXMgPD0gaXJxKQo+ICAgICAgICAgICAgICAgICByZXR1cm47Cj4gLSAgICAgICBp
cnFkID0gJmFwbGljLT5pcnFzW2lycV07Cj4gKyAgICAgICBpcnFkID0gJmFwbGljLT5pcnFzW2Fy
cmF5X2luZGV4X25vc3BlYyhpcnEsIGFwbGljLT5ucl9pcnFzKV07Cj4KPiAgICAgICAgIHZhbCAm
PSBBUExJQ19UQVJHRVRfRUlJRF9NQVNLIHwKPiAgICAgICAgICAgICAgICAoQVBMSUNfVEFSR0VU
X0hBUlRfSURYX01BU0sgPDwgQVBMSUNfVEFSR0VUX0hBUlRfSURYX1NISUZUKSB8Cj4gQEAgLTEx
Niw3ICsxMTcsNyBAQCBzdGF0aWMgYm9vbCBhcGxpY19yZWFkX3BlbmRpbmcoc3RydWN0IGFwbGlj
ICphcGxpYywgdTMyIGlycSkKPgo+ICAgICAgICAgaWYgKCFpcnEgfHwgYXBsaWMtPm5yX2lycXMg
PD0gaXJxKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gLSAgICAgICBpcnFkID0g
JmFwbGljLT5pcnFzW2lycV07Cj4gKyAgICAgICBpcnFkID0gJmFwbGljLT5pcnFzW2FycmF5X2lu
ZGV4X25vc3BlYyhpcnEsIGFwbGljLT5ucl9pcnFzKV07Cj4KPiAgICAgICAgIHJhd19zcGluX2xv
Y2tfaXJxc2F2ZSgmaXJxZC0+bG9jaywgZmxhZ3MpOwo+ICAgICAgICAgcmV0ID0gKGlycWQtPnN0
YXRlICYgQVBMSUNfSVJRX1NUQVRFX1BFTkRJTkcpID8gdHJ1ZSA6IGZhbHNlOwo+IEBAIC0xMzIs
NyArMTMzLDcgQEAgc3RhdGljIHZvaWQgYXBsaWNfd3JpdGVfcGVuZGluZyhzdHJ1Y3QgYXBsaWMg
KmFwbGljLCB1MzIgaXJxLCBib29sIHBlbmRpbmcpCj4KPiAgICAgICAgIGlmICghaXJxIHx8IGFw
bGljLT5ucl9pcnFzIDw9IGlycSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+IC0gICAgICAg
aXJxZCA9ICZhcGxpYy0+aXJxc1tpcnFdOwo+ICsgICAgICAgaXJxZCA9ICZhcGxpYy0+aXJxc1th
cnJheV9pbmRleF9ub3NwZWMoaXJxLCBhcGxpYy0+bnJfaXJxcyldOwo+Cj4gICAgICAgICByYXdf
c3Bpbl9sb2NrX2lycXNhdmUoJmlycWQtPmxvY2ssIGZsYWdzKTsKPgo+IEBAIC0xNzAsNyArMTcx
LDcgQEAgc3RhdGljIGJvb2wgYXBsaWNfcmVhZF9lbmFibGVkKHN0cnVjdCBhcGxpYyAqYXBsaWMs
IHUzMiBpcnEpCj4KPiAgICAgICAgIGlmICghaXJxIHx8IGFwbGljLT5ucl9pcnFzIDw9IGlycSkK
PiAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+IC0gICAgICAgaXJxZCA9ICZhcGxpYy0+
aXJxc1tpcnFdOwo+ICsgICAgICAgaXJxZCA9ICZhcGxpYy0+aXJxc1thcnJheV9pbmRleF9ub3Nw
ZWMoaXJxLCBhcGxpYy0+bnJfaXJxcyldOwo+Cj4gICAgICAgICByYXdfc3Bpbl9sb2NrX2lycXNh
dmUoJmlycWQtPmxvY2ssIGZsYWdzKTsKPiAgICAgICAgIHJldCA9IChpcnFkLT5zdGF0ZSAmIEFQ
TElDX0lSUV9TVEFURV9FTkFCTEVEKSA/IHRydWUgOiBmYWxzZTsKPiBAQCAtMTg2LDcgKzE4Nyw3
IEBAIHN0YXRpYyB2b2lkIGFwbGljX3dyaXRlX2VuYWJsZWQoc3RydWN0IGFwbGljICphcGxpYywg
dTMyIGlycSwgYm9vbCBlbmFibGVkKQo+Cj4gICAgICAgICBpZiAoIWlycSB8fCBhcGxpYy0+bnJf
aXJxcyA8PSBpcnEpCj4gICAgICAgICAgICAgICAgIHJldHVybjsKPiAtICAgICAgIGlycWQgPSAm
YXBsaWMtPmlycXNbaXJxXTsKPiArICAgICAgIGlycWQgPSAmYXBsaWMtPmlycXNbYXJyYXlfaW5k
ZXhfbm9zcGVjKGlycSwgYXBsaWMtPm5yX2lycXMpXTsKPgo+ICAgICAgICAgcmF3X3NwaW5fbG9j
a19pcnFzYXZlKCZpcnFkLT5sb2NrLCBmbGFncyk7Cj4gICAgICAgICBpZiAoZW5hYmxlZCkKPiBA
QCAtMjA1LDcgKzIwNiw3IEBAIHN0YXRpYyBib29sIGFwbGljX3JlYWRfaW5wdXQoc3RydWN0IGFw
bGljICphcGxpYywgdTMyIGlycSkKPgo+ICAgICAgICAgaWYgKCFpcnEgfHwgYXBsaWMtPm5yX2ly
cXMgPD0gaXJxKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gLSAgICAgICBpcnFk
ID0gJmFwbGljLT5pcnFzW2lycV07Cj4gKyAgICAgICBpcnFkID0gJmFwbGljLT5pcnFzW2FycmF5
X2luZGV4X25vc3BlYyhpcnEsIGFwbGljLT5ucl9pcnFzKV07Cj4KPiAgICAgICAgIHJhd19zcGlu
X2xvY2tfaXJxc2F2ZSgmaXJxZC0+bG9jaywgZmxhZ3MpOwo+Cj4gQEAgLTI1NCw3ICsyNTUsNyBA
QCBzdGF0aWMgdm9pZCBhcGxpY191cGRhdGVfaXJxX3JhbmdlKHN0cnVjdCBrdm0gKmt2bSwgdTMy
IGZpcnN0LCB1MzIgbGFzdCkKPiAgICAgICAgIGZvciAoaXJxID0gZmlyc3Q7IGlycSA8PSBsYXN0
OyBpcnErKykgewo+ICAgICAgICAgICAgICAgICBpZiAoIWlycSB8fCBhcGxpYy0+bnJfaXJxcyA8
PSBpcnEpCj4gICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gLSAgICAgICAgICAg
ICAgIGlycWQgPSAmYXBsaWMtPmlycXNbaXJxXTsKPiArICAgICAgICAgICAgICAgaXJxZCA9ICZh
cGxpYy0+aXJxc1thcnJheV9pbmRleF9ub3NwZWMoaXJxLCBhcGxpYy0+bnJfaXJxcyldOwo+Cj4g
ICAgICAgICAgICAgICAgIHJhd19zcGluX2xvY2tfaXJxc2F2ZSgmaXJxZC0+bG9jaywgZmxhZ3Mp
Owo+Cj4gQEAgLTI4Myw3ICsyODQsNyBAQCBpbnQga3ZtX3Jpc2N2X2FpYV9hcGxpY19pbmplY3Qo
c3RydWN0IGt2bSAqa3ZtLCB1MzIgc291cmNlLCBib29sIGxldmVsKQo+Cj4gICAgICAgICBpZiAo
IWFwbGljIHx8ICFzb3VyY2UgfHwgKGFwbGljLT5ucl9pcnFzIDw9IHNvdXJjZSkpCj4gICAgICAg
ICAgICAgICAgIHJldHVybiAtRU5PREVWOwo+IC0gICAgICAgaXJxZCA9ICZhcGxpYy0+aXJxc1tz
b3VyY2VdOwo+ICsgICAgICAgaXJxZCA9ICZhcGxpYy0+aXJxc1thcnJheV9pbmRleF9ub3NwZWMo
c291cmNlLCBhcGxpYy0+bnJfaXJxcyldOwo+ICAgICAgICAgaWUgPSAoYXBsaWMtPmRvbWFpbmNm
ZyAmIEFQTElDX0RPTUFJTkNGR19JRSkgPyB0cnVlIDogZmFsc2U7Cj4KPiAgICAgICAgIHJhd19z
cGluX2xvY2tfaXJxc2F2ZSgmaXJxZC0+bG9jaywgZmxhZ3MpOwo+IC0tCj4gMi41MS4wCj4KCi0t
IAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
