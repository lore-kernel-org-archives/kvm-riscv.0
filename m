Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD84CD6E4C
	for <kvm-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 06:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=60t2jyKeFc5mOJ38ULaGShRnf6RbEZLUlwihFGAqEe4=; b=PJUAglHbxXELEh
	ftBFpYm/TVkUl6hwRHi4aBOwooE4hLRsadEwgXAJLRu7l4YvvGFcIS+o7mpRlax0M/neEW/2uBAyq
	4KNO4oVHZpKA5Vrb+KgcikxQfwr0fUiMd/kFGxM9o2oQOZ8/IvKqETLyBdCsMSetmoocKOjJsAeh3
	rrRMzQGELvWu09rXiyS9yiX5YoTq05iMTHt5goRerZ3x6PjyzsWGQVxZB5dKWoaGkbdUl6elM/h4J
	hE5jDS8c8RbNGp9AbPu/24vihILVKa6goblpO7cro6YRpxzxI2YobqM7cdINsjo70Dxrw2ITvL0MC
	BvOpHxDHqOvFWkNqxd2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTw3X-0000000ACNT-285K;
	Mon, 01 Jun 2026 06:23:23 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTw3V-0000000ACMQ-1BEa
	for kvm-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 06:23:22 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7e6c733856aso198141a34.2
        for <kvm-riscv@lists.infradead.org>; Sun, 31 May 2026 23:23:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780295000; cv=none;
        d=google.com; s=arc-20240605;
        b=aA6zrxCoAcDDt4xADOcEO5ciBIvVGRP3Zrw6AOGLE7Ltc+BrAOgOE2HVSTsX7nTUOb
         bXtZqOiHhwd3tyu1s2qGlkHlYCvYnb9goIIGo4HSh8hP24p3GcDCWTxC4L/1nV3ALAzc
         R47EVhJuFFjz38xbJu246M7vEZBCW5NSfv5rgVj56MaH6nGqyep6/US0LG7Fw/f3LrXf
         E83iJKcIiopjQ7hV56zU6fUm/hnbcgHUfWHrrkO7KTnLpeNkyI2C/opXv5w9l0snbYmx
         +95PJECu6tA/gn4IE53oQulaAq7XbRuXh0Vy/p5G8qTmWfH06EiiGdrb97ZSLffqOyLG
         Do4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iz7SBrm1vl57dsqbfyKBrpGP7ySQe0QBEwPa7zAZwY8=;
        fh=9WKuCEo9IV3Yvbo4uckkAmDDDWu6tI73Hrzi2ED+ZCs=;
        b=K9mmO3wh3mlOSNu6ySt67CFyx8jYd6i0jpR256hvfLlLUTvV1Ig/XMGmaJ0XYAQs6Y
         C7klemTFIcWBv8Fp4zZv09Iw3+2gGEanygw5TPzUQVqN0KPmbvI5k1JV/e/puGjjjY+6
         RBFjnAA0rsK3S+N9YqbEyM46ctUXxFUNSxjcTchySUNTUrwzztAoUtWvlIU00OSTUYDN
         trWoKK88yOk/c+fTgGFL4G85PbbIN0bV/7oSewwxR467ooQzUiWa/mnaP5Zf5sXHy+Ye
         139BqTHjoN6S06XS5OEVN4b9fd4ANjMh9kZGrCrlJO2EKthC612LR2k36btjbrDIXB0T
         6E0w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780295000; x=1780899800; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iz7SBrm1vl57dsqbfyKBrpGP7ySQe0QBEwPa7zAZwY8=;
        b=eXZ4u0Tj92rxezndxzGk+8ANtoIsD0sUnJ6aU3TvGL9s80+OpNkmz9yLFigoh1qYg4
         3zO4qMNTGCHEdM3EtFkyZLnle0VkXUy6B3QKsqqVvVDTqDH2u2E2C6eGgSogBNB3X67U
         VJKB4V3cZRlnCkwL2wJxnTbpTrUM6YS2VmiWI8UKk0P/gzodmClylqYKoxlQa5sZM6xy
         TneiR7fWSlGdlrsHpF1C+6FTotK2CQUTFW7VapJ3BozCp4wxLb6X9fTTKEqpygvVATUA
         r67qPJLlyj5qlTeFnEQ+q92lgn4Pes7+VRJIHvydUJug7jfmW/y2e7I02sPM4uMfky4Y
         Aftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780295000; x=1780899800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iz7SBrm1vl57dsqbfyKBrpGP7ySQe0QBEwPa7zAZwY8=;
        b=GMwUpZVZ39Ze+KSz/pLnA/oAuQk8WE4o/QlK4QuwsCgr/1A5hlfQ/NtvxeiDoTgSqq
         Bi7HrZnEexS2k7r+wxgBZ+Li/3R+icSlMyQqhgqagzsmBR1VDd3uI2zv+R4qP9pzmy/m
         gTnHGNmBr9cx+eLAacj1htr3x2wBEOFIO2l9QLncvzaKGMU8fOs+BvNY8hKDFYZWf3pg
         2WM3OBJAk0sEq5E0kl/HX8c5BD0d8seZGCjbdWUmFQKRTh3H+nz/2RfltEGshtLHfGdc
         NBpzi6WTcOFXxguhFO8TvI3Z2CMfFk1YYbN9ytrUTP9F2HhcF98+FW1qqSKLAr7S74fs
         wbLw==
X-Forwarded-Encrypted: i=1; AFNElJ+yeJysAe0cmefeJh/mVz9J2bwS5CD3Gt0g90Ll7kTldRWxVn4i+1j7NHTnkhXatrmRODU6d2gYxT8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwQFCoDbQKABLMg9szZAPSXxA2dH8eQNoYKnDhHDTtkecc+iRZz
	MExh4XOzGmYxZ8LHJ8NfZ38pC5dsOi7ob96gOtAYOFZVJv1dWwIqOy5NyP86iuPM9uXbfgIRmZX
	jbYGtSSMtv0z0qdMDr1ACqFVclBgFvK4UWzwJOmd+Kg==
X-Gm-Gg: Acq92OF51FeuCb34mRbqk00zvpavigwAOCttYJDg/ybJJ7eNKIUTz01DZDsl1ibzi+E
	sMCddSKdLFMjw2+NTZhI7noDXZoENe4W+PYvfbkz6jLQRO7ZJ1b0E56M5CNIufMgGdtoq1ToE+l
	+zRdAwdaYMw7Fldgpx0k3+/yjZwmj2NjINQGt9TZDp7kwC6hjtQm5372QBlbc81yDk+1qXkOr/c
	k2xtQ7XWFbQlFP0dVy7p24nPU+Y7lZyew0DO/mo6qim5grVWvKdJDaxLt8sigIBNenEWroxIkvk
	piwgaX1zsFVe1XPdlyOiyXGuRHHzwoIlX/uoXBGjV5C8sOt3liqq3gSoJEvzmS2OO8UvlMIS4Z2
	88Or2cktMX/aX3bdbHTIo8lOP33b0ZHAD3Pe9xlif3k1SGgY1
X-Received: by 2002:a4a:edc6:0:b0:69d:9e9d:b000 with SMTP id
 006d021491bc7-69e102bff96mr4763041eaf.23.1780295000445; Sun, 31 May 2026
 23:23:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260429173002565bdp1o7P0bvOs6yTz64yNx@zte.com.cn> <20260429173529259zFOx-ZsqSl_DS82KLXv0S@zte.com.cn>
In-Reply-To: <20260429173529259zFOx-ZsqSl_DS82KLXv0S@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 1 Jun 2026 11:53:07 +0530
X-Gm-Features: AVHnY4IK8KCCerdq2ROMJ7Vw6kUdLfOeVHB9CyJGSx470faQyO8EQ5cmziGag78
Message-ID: <CAAhSdy3W4U_wYuH_pKq-V6iP6UE7e9h9Zhv=hKLykvWpiTEGVg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] RISC-V: KVM: Refactor kvm_arch_commit_memory_region()
To: wang.yechao255@zte.com.cn
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_232321_327040_FD19CF6E 
X-CRM114-Status: GOOD (  21.42  )
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

T24gV2VkLCBBcHIgMjksIDIwMjYgYXQgMzowNeKAr1BNIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPiB3cm90ZToKPgo+IEZyb206IFdhbmcgWWVjaGFvIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPgo+Cj4gUmVmYWN0b3Iga3ZtX2FyY2hfY29tbWl0X21lbW9yeV9yZWdpb24oKSBhcyBhIHBy
ZXBhcmF0aW9uIGZvciBhIGZ1dHVyZQo+IGNvbW1pdCB0byBsb29rIGNsZWFuZXIgYW5kIG1vcmUg
dW5kZXJzdGFuZGFibGUuIEFsc28sIGl0IGxvb2tzIG1vcmUKPiBsaWtlIGl0cyBhcm02NCBhbmQg
eDg2IGNvdW50ZXJwYXJ0cy4KClRoaXMgY2xhaW0gb2YgbWFraW5nIGl0IHNpbWlsYXIgdG8gYXJt
NjQgYW5kIHg4NiBpcyBpbmNvcnJlY3QuIFNlZSBiZWxvdy4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBX
YW5nIFllY2hhbyA8d2FuZy55ZWNoYW8yNTVAenRlLmNvbS5jbj4KPiAtLS0KPiAgYXJjaC9yaXNj
di9rdm0vbW11LmMgfCAxMiArKysrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9t
bXUuYyBiL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gaW5kZXggMmQzZGVmMDI0MjcwLi5kYzZhOGVm
ZGU5OWUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiArKysgYi9hcmNoL3Jp
c2N2L2t2bS9tbXUuYwo+IEBAIC0xNDEsMTIgKzE0MSwyMiBAQCB2b2lkIGt2bV9hcmNoX2NvbW1p
dF9tZW1vcnlfcmVnaW9uKHN0cnVjdCBrdm0gKmt2bSwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnN0IHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKm5ldywKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGVudW0ga3ZtX21yX2NoYW5nZSBjaGFuZ2UpCj4gIHsKPiAr
ICAgICAgIGJvb2wgbG9nX2RpcnR5X3BhZ2VzID0gbmV3ICYmIG5ldy0+ZmxhZ3MgJiBLVk1fTUVN
X0xPR19ESVJUWV9QQUdFUzsKPiArICAgICAgIGJvb2wgcmVhZF9vbmx5ID0gbmV3ICYmIG5ldy0+
ZmxhZ3MgJiBLVk1fTUVNX1JFQURPTkxZOwo+ICsKPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBO
b3RoaW5nIG1vcmUgdG8gZG8gZm9yIFJPIHNsb3RzICh3aGljaCBjYW4ndCBiZSBkaXJ0aWVkIGFu
ZCBjYW4ndCBiZQo+ICsgICAgICAgICogbWFkZSB3cml0YWJsZSkgb3IgQ1JFQVRFL01PVkUvREVM
RVRFIG9mIGEgc2xvdC4KPiArICAgICAgICAqLwo+ICsgICAgICAgaWYgKChjaGFuZ2UgIT0gS1ZN
X01SX0ZMQUdTX09OTFkpIHx8IHJlYWRfb25seSkKPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+
ICsKCkkgZG9uJ3Qgc2VlIGhvdyB0aGlzIGlzIHNhbWUgYXMgd2hhdCB4ODYgYW5kIGFybTY0IGRv
ZXMuIFRoZXJlIGlzCm5vIHNwZWNpYWwgY2FzaW5nIGZvciBLVk1fTVJfRkxBR1NfT05MWSBpbiB4
ODYgYW5kIGFybTY0LgoKPiAgICAgICAgIC8qCj4gICAgICAgICAgKiBBdCB0aGlzIHBvaW50IG1l
bXNsb3QgaGFzIGJlZW4gY29tbWl0dGVkIGFuZCB0aGVyZSBpcyBhbgo+ICAgICAgICAgICogYWxs
b2NhdGVkIGRpcnR5X2JpdG1hcFtdLCBkaXJ0eSBwYWdlcyB3aWxsIGJlIHRyYWNrZWQgd2hpbGUK
PiAgICAgICAgICAqIHRoZSBtZW1vcnkgc2xvdCBpcyB3cml0ZSBwcm90ZWN0ZWQuCj4gICAgICAg
ICAgKi8KPiAtICAgICAgIGlmIChjaGFuZ2UgIT0gS1ZNX01SX0RFTEVURSAmJiBuZXctPmZsYWdz
ICYgS1ZNX01FTV9MT0dfRElSVFlfUEFHRVMpIHsKPiArICAgICAgIGlmIChsb2dfZGlydHlfcGFn
ZXMpIHsKCldoeSBkcm9wICJjaGFuZ2UgIT0gS1ZNX01SX0RFTEVURSIgPwoKPiAgICAgICAgICAg
ICAgICAgaWYgKGt2bV9kaXJ0eV9sb2dfbWFudWFsX3Byb3RlY3RfYW5kX2luaXRfc2V0KGt2bSkp
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuOwo+ICAgICAgICAgICAgICAgICBtbXVf
d3BfbWVtb3J5X3JlZ2lvbihrdm0sIG5ldy0+aWQpOwo+IC0tCj4gMi40My41CgpSZWdhcmRzLApB
bnVwCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNj
dgo=
