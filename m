Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DB8C369D5
	for <kvm-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 17:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xrHDvQcCgAFrOIMiOHHe+a8jbYKfVMM+fZWhxzN1DGc=; b=pkV2Dr0jmdtsh8
	7Rf3plEyZQPL+nwM7DZVx71tHhl7q3fHOplJN8M2Oc30gz1802HGLsYAIxjYJ+TYUOFJTPIA2drHm
	Mrg6s8z99axYJilOtS4uC1CcTBWHNxNzZXNsoBvmxp8Xr0+OFGOP996l82+FjL7QtI7uhu6abyvqU
	WWCxGk57lTVwr+vBeAtwHk2hlosOexNNbaIIWQC461Rb3RLV/9zdMbveu+4xxSVjTiJTDvqVYbLO8
	7ARH1108zCcF6xNkWKiOJcohwOkVyQTNKODkl6jN8FynGmdS4jDLl+5Ugsr+I1kk4h9HQ+WNT+ZHa
	OPCr5UnOUALoY4LBP1LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9SZJ-000000078Hz-28Y6;
	Mon, 28 Apr 2025 17:47:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9SY8-000000078Be-2FPh
	for kvm-riscv@bombadil.infradead.org;
	Mon, 28 Apr 2025 17:45:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=v/CANhKWFmJawB0p8jQ/NyjybjgGkYzY/3LSqUuDHX0=; b=NquvwAO2O0i3XjtXNQ8IfbpevV
	A8AQhDFa7SLTNPhjAet4F2Aze830zy77vitXFmXiupwyiq4/tyg9FSeXfJPL8f3i2EzTLuO4700VY
	rqwZ9HJszyO0XuYRG4cSkXrvbE55MOAvbJjEd4k+Ef7GZujt+MRtTx1T9sqAJx5nbUDBD5ED3AJw8
	qKnUm5vOngKwjAPBg+gLIDLKFY5E3Zbdsess9tRRNMB6/TkS2mrUAAB1ULs6zADkg3Qlv7NPW8Za5
	t/K6PssRbwxcKMnZz8vNrbmEHgdt+bKOAvmZkXJmztvs4hak5l+oheBNwwT4p/D+a+xRrKDhFC63z
	VDOoiGOw==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9SY5-0000000Cw9e-24wG
	for kvm-riscv@lists.infradead.org;
	Mon, 28 Apr 2025 17:45:47 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43cf7c2c351so4271595e9.0
        for <kvm-riscv@lists.infradead.org>; Mon, 28 Apr 2025 10:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745862342; x=1746467142; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/CANhKWFmJawB0p8jQ/NyjybjgGkYzY/3LSqUuDHX0=;
        b=ZOE9Vjm/94eqnlUKf1piYxvjOkImGw/iG2vNmPv6d/AFDEVpum9qDVv+Xb+3eloSnp
         Zr9vD65PD9VbGtMoTBkUFVTW0VPm1zAUqSGTulz9nDcymHdlTVJkTOVLgrESkTNF9MZ/
         MNJeOlLhf80aUAY3ff3EIkWIr4/jnEj4zncCDhZPLGe6OJRlhy4jproaG816zr7j0rw8
         O4dI+NHZ247d0h9KJfL/Xqqv2xAS7N+MFFEMHAYMtTNeOG1Ujb0hOaGFsK6+qRumlvCB
         ECaPgXOPj+Hz/hjarxPmGru+pB60/RLI2I+LfNgQFgTs+NIT7kUpnGkV2MX63tlIQBgb
         z41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745862342; x=1746467142;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v/CANhKWFmJawB0p8jQ/NyjybjgGkYzY/3LSqUuDHX0=;
        b=WDtluQ44O3YeDIh8eD6KP+7k+T+Jz4hIkR8IrVMp75XSUPfbBvoS6tKF8uWMb5SjEo
         lEkd66hw+vETZzPNdOwUkNPadEliascgn5dLUlV/5n3kCx9lMx+ghsHBtNzTvM1LkTnO
         h7mruY+HboaUANsKBN87nyV5Cg5XIveXzhKMbA9pYToHMN5dDXx1MKgoF9rSmAaV+1c4
         EAsQFT616vhx0UtpAYZnOlHqnOcgZ+hgEO7LDKkU2k8+B1FL263VaV3mdTPSiT5wg3tX
         VeiujAvo6++6VDGve5QfBwEUOWr7UE9DChgc9wOzTf4/w4h7/uPun3+triY7BSaHv+mZ
         gR/Q==
X-Gm-Message-State: AOJu0YxOzHFPee+G2TTgaKss1gjM69EM241fZ+qsubjaQ/DjZiS/Ik21
	a4EpSSVvJ7QLU7eNKwAtAMDdIEO/tcG1ps000M9pli0P7LM60v1HHnK7fGUXZKIt1hxkX4C/XG9
	TDPU=
X-Gm-Gg: ASbGncuSbz7LG22X2l9Xbs1sOOwPcnSUwDsgfW8nSVNKAbI5w7ekF767WD6L9wFTpoE
	mt7/BQSuiOQ7EzcLtg7szOofsNrDipJA15LbUmkFNDQjxBcvMOEokWH/uBBMqrw3tEOtcyZIvPq
	RTcPb1FKO8rVlfmQcx7YiR3epb2EaCLQ0EJC/+FxUlDk2bKtJGfGV4WFiXv+1gDnIUKj6k64+tY
	RuC5PGN44aNSXDRLNSCYw3rZzi5skQpmkU3AHD0Xn7eXm5DcU8/N4ytNqAJqJzj5AUTGjunAxII
	FWW1uxzNZJmn3gR9LASpaORraxfF0iTUqyLmZPXflFzQqvQ=
X-Google-Smtp-Source: AGHT+IEvyyRwv+siNkS/+KKa7cPTZaQ24k7dR1L6NM8zAaZ/ZacC5UiUMQME2xFD4O4sKzfsTBeP0Q==
X-Received: by 2002:a05:600c:3b82:b0:439:9fde:da76 with SMTP id 5b1f17b1804b1-440a634912dmr44268285e9.0.1745862342603;
        Mon, 28 Apr 2025 10:45:42 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:785:f3a7:1fbb:6b76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46a54sm11977490f8f.67.2025.04.28.10.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:45:42 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 28 Apr 2025 19:45:41 +0200
Message-Id: <D9IGJR9DGFAM.1PVHVOOTVRFZW@ventanamicro.com>
Subject: Re: [PATCH 4/5] KVM: RISC-V: reset VCPU state when becoming
 runnable
Cc: <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Atish
 Patra" <atishp@atishpatra.org>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, "Andrew Jones"
 <ajones@ventanamicro.com>, "Mayuresh Chitale" <mchitale@ventanamicro.com>
To: "Anup Patel" <anup@brainfault.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-7-rkrcmar@ventanamicro.com>
 <CAAhSdy0e3HVN6pX-hcX2N+kpwsupsCf6BqrYq=bvtwtFOuEVhA@mail.gmail.com>
In-Reply-To: <CAAhSdy0e3HVN6pX-hcX2N+kpwsupsCf6BqrYq=bvtwtFOuEVhA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_184545_631461_5ED7B3F0 
X-CRM114-Status: GOOD (  13.22  )
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

MjAyNS0wNC0yOFQxNzo1MjoyNSswNTozMCwgQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz46Cj4gT24gVGh1LCBBcHIgMywgMjAyNSBhdCA1OjAy4oCvUE0gUmFkaW0gS3LEjW3DocWZIDxy
a3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+PiBGb3IgYSBjbGVhbmVyIHNvbHV0aW9u
LCB3ZSBzaG91bGQgYWRkIGludGVyZmFjZXMgdG8gcGVyZm9ybSB0aGUgS1ZNLVNCSQo+PiByZXNl
dCByZXF1ZXN0IG9uIHVzZXJzcGFjZSBkZW1hbmQuICBJIHRoaW5rIGl0IHdvdWxkIGFsc28gYmUg
bXVjaCBiZXR0ZXIKPj4gaWYgdXNlcnNwYWNlIHdhcyBpbiBjb250cm9sIG9mIHRoZSBwb3N0LXJl
c2V0IHN0YXRlLgo+Cj4gQXBhcnQgZnJvbSBicmVha2luZyBLVk0gdXNlci1zcGFjZSwgdGhpcyBw
YXRjaCBpcyBpbmNvcnJlY3QgYW5kCj4gZG9lcyBub3QgYWxpZ24gd2l0aCB0aGU6Cj4gMSkgU0JJ
IHNwZWMKPiAyKSBPUyBib290IHByb3RvY29sLgo+Cj4gVGhlIFNCSSBzcGVjIG9ubHkgZGVmaW5l
cyB0aGUgZW50cnkgc3RhdGUgb2YgY2VydGFpbiBDUFUgcmVnaXN0ZXJzCj4gKG5hbWVseSwgUEMs
IEEwLCBhbmQgQTEpIHdoZW4gQ1BVIGVudGVycyBTLW1vZGU6Cj4gMSkgVXBvbiBTQkkgSFNNIHN0
YXJ0IGNhbGwgZnJvbSBzb21lIG90aGVyIENQVQo+IDIpIFVwb24gcmVzdW1pbmcgZnJvbSBub24t
cmV0ZW50aXZlIFNCSSBIU00gc3VzcGVuZCBvcgo+ICAgICBTQkkgc3lzdGVtIHN1c3BlbmQKPgo+
IFRoZSBTLW1vZGUgZW50cnkgc3RhdGUgb2YgdGhlIGJvb3QgQ1BVIGlzIGRlZmluZWQgYnkgdGhl
Cj4gT1MgYm9vdCBwcm90b2NvbCBhbmQgbm90IGJ5IHRoZSBTQkkgc3BlYy4gRHVlIHRvIHRoaXMs
IHJlYXNvbgo+IEtWTSBSSVNDLVYgZXhwZWN0cyB1c2VyLXNwYWNlIHRvIHNldCB1cCB0aGUgUy1t
b2RlIGVudHJ5Cj4gc3RhdGUgb2YgdGhlIGJvb3QgQ1BVIHVwb24gc3lzdGVtIHJlc2V0LgoKV2Ug
Y2FuIGhhbmRsZSB0aGUgaW5pdGlhbCBzdGF0ZSBjb25zaXN0ZW5jeSBpbiBvdGhlciBwYXRjaGVz
LgpXaGF0IG5lZWRzIGFkZHJlc3NpbmcgaXMgYSB3YXkgdG8gdHJpZ2dlciB0aGUgS1ZNIHJlc2V0
IGZyb20gdXNlcnNwYWNlLApldmVuIGlmIG9ubHkgdG8gY2xlYXIgdGhlIGludGVybmFsIEtWTSBz
dGF0ZS4KCkkgdGhpbmsgbXBfc3RhdGUgaXMgY3VycmVudGx5IHRoZSBiZXN0IHNpZ25hbGl6YXRp
b24gdGhhdCBLVk0gc2hvdWxkCnJlc2V0LCBzbyBJIGFkZGVkIGl0IHRoZXJlLgoKV2hhdCB3b3Vs
ZCBiZSB5b3VyIHByZWZlcnJlZCBpbnRlcmZhY2UgZm9yIHRoYXQ/CgpUaGFua3MuCgoKLS0gCmt2
bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
