Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A3E0F3ED59
	for <kvm-riscv@archiver.kernel.org>; Sat, 11 Apr 2026 16:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZDHnCqCjVt7hEAnlXwTcy9Nu0mKwWW3QPqKUZlEc0R4=; b=B6e7Uax6NZLuqc
	pv1PfyQP1gP6h6MkibyMvi5EsJ3zMxBZuAaVFQiCN0KOS5DdXjt/xERsKvqMo9mRJH9i8+bzwm/O3
	Pa9YuksOW55vzGvVa8eepIbF7KXPN3frtmKWBwj3HuDDInm92dOTTwT0FcQLIXVNNZIyj++urBbEk
	2AlRB+cFQs57m3aIAkZqSBFWDB27FKRBUDU1ByX5ZwkTknSmiV6OijKarosHhPHNH5DLi6Rf8QCWG
	UPY+2dy/KtIWJsQk8fTaM2ST9r0nMEtwfnku/e319L7n6fo3tZIg/khl/7Mq7B3wWOxx1gFlP377d
	SS/DDM4GEhmPWIl3V9ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBbZ6-0000000DeJZ-3Mi3;
	Sat, 11 Apr 2026 16:52:12 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBbZ4-0000000DeIP-22w8
	for kvm-riscv@lists.infradead.org;
	Sat, 11 Apr 2026 16:52:11 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7d4c12ff3d5so2788741a34.2
        for <kvm-riscv@lists.infradead.org>; Sat, 11 Apr 2026 09:52:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775926329; cv=none;
        d=google.com; s=arc-20240605;
        b=JITsiz48T2FBNj5t8Zpyc8lGpC1vaRQiwA3CLurjJS0gjT/1wS+7nLZmS/AOE6s15i
         JO7qCk6IruXJQG9017BOwjbkwYVnerWPQ7xxeqgIwUXyE5BgyWQX2HrKRhQ96549l8Gl
         nJsW0m/qmwVeAKMB34J2i1euCt8ECVAwRp+/VPxdQttNsjt0MXA+Bo6jnyCmWNL+LXwv
         LN+S1EutRf/5z9j/quF/0942J/HTizz7LN3FzG7AlI6VkQs6GJ3p9VzAiNlqBfg/UiG/
         YFZ3h+yPIYMFB5N0+OtVuAuRzYBYtXqdo/gw5wq/j/i50uBdAq4f7Bo4zpDMvg9dfRjL
         nF8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FX/lULpKSMagkle3KXgfcJbERn4/bCQpLyp4j5tdJGs=;
        fh=gb+78aH1HAyF5BDUQJ5d0SZjZGYhL4e1T48rSOxL43E=;
        b=X2b06MDXChJXn1DlK4dD/qR6idFL3noEaMexVyqOqinqR+ba2I8IIRTokmgBW0+hcE
         D3G5t3bdgp6ZuPTL5JBUlnw0GbG4csb+MU4P2a6BSkekfezFnMYGJxkDdTsC/zQcFDbY
         EUwHkAgeDpIPcrlNmCfSfs8m5ug+Nr8APrYCIxy978zwv7k6Hw7rmhULTe/kFeRZKwTQ
         22Yz2PSSvxxbEsdKTci8o9mN/nL6yEyyP5XwYP5rTR/NP5lRFNmzvayJslNaOYwSSjz3
         T9oJqvDhZLrFpZ5gV203KsXFxXrhnen92D/XTZAGYwzXRT2I+ZWkMALJDjL2dbHIOy5J
         odUQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775926329; x=1776531129; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FX/lULpKSMagkle3KXgfcJbERn4/bCQpLyp4j5tdJGs=;
        b=gpSB9stsVwq4GLR5glbABNLCRDsFdQ9HFoNfB3vgKlF6qnG3BEywb1vaMqCxBQEE2v
         L/TTy4m9lwmYFP22xSQ19CdbpRFNkvlJZ0eK/gxTA2dUlxOff75s6bVk6oBk5YmN5MPE
         /R9DMy38ouGAFESVQm/XcmUIc6ve/ZXc9TlC9JeA2SyU+g9nJC2f84EAzLqFvuc/nL2p
         MJqwpKngKRLi5Z1jfU8+AzoU6dQBGaRcTQ9GG/FCABN+qnSbd2HwrYSp/nC9oQVToJu2
         2H9hxct2QL3bFSyxjSlS1BviIo8qhqwlrEt74G/KVcNHxLdrcJ8y8VJq7D484gW6ayDf
         aTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775926329; x=1776531129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FX/lULpKSMagkle3KXgfcJbERn4/bCQpLyp4j5tdJGs=;
        b=C92vXGVKq6rM/qINeZjV3Nptb7QXDfS8OHWiY7MgTGavQQyhHG84AzvIVGUSTV5IJ4
         6VzPKXK/TExUDgPn0i5KL6b4uAchMKSEoPoutLzC5rPT4rviAcJ8/M1hfD2zGdnOtL0y
         hwbkSKSKGvWfEBpk734EwlGieoK11T2Absiah2p8nWtOQjYHdbpB9agb3CSEX69TDRs3
         0RdvRnzM2ub0bg9T2mAlb3kzxhnlUPRQyRQ5+LzTV8RDqkqUgDI4EEidgZkViWj6pe5f
         lAVGpyPj+wXO60atUC4tJUV7ehXgp/bzFb1OSE9nfBwue8BHXx6QiMEHCLaluthr+66w
         qFUg==
X-Forwarded-Encrypted: i=1; AJvYcCX/loQcftNhGrSEbKxVet5aUJ1F2qw6G2ipoEtX/gaAWOiswbxdhDg4VrgpW/mFABw4mDGtxqkM4tI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzpBsCJqIb7OgK+yzZIB0wbtY2/FdIj1doXlvJpHxhGTTqU+B39
	DsW2Y6Yxy0HqCWQFxezfyX+uI2SO7Gn+jDB3TZ+ekgsfA0ZhUbjfL1YOe6VbzS0srtO5UTNKIIF
	DmKwcZn0Cuk4U2Pcr1opYp2znrETNaU78SLbeYNsqOg==
X-Gm-Gg: AeBDieuw1lANEthWf9J9SzkH+Zq6b7q7dNlymtWIHQkPLKpRtaBbRPI/hT8d9WeSW4T
	Aco+liPOj2Pz18G6dQOoZHx3oOkgMWqAcrDGNxxTT6YEIyQqBpgBo6QKz3L8OPKl644gxmpZXVz
	V+AFNVeE2wVhvWISncP37iiTWjphdQ2QH4VdRN4q8Lz6TYskoLtGQH7ZX8HkGESsHCnogoQeQtA
	qpFJo/1kBc86QwCm55+BaXBVXDrmfRwBp0akQFVJSlc3X3CwO66IMas4bhtYKH7ZxeZRSkCdnPr
	eS6k1xLpb27tcV2VmcFQWFRSlCVigcRwnKtBNEns/vRQKDgwzAq19xzEFPqtDgdd1kR4lMwY1at
	Z60HU6uNjuCML/BZisWIZ1KG2bw4SIXAuyjvWfQ==
X-Received: by 2002:a05:6820:62a:b0:67e:313e:22c4 with SMTP id
 006d021491bc7-68be85d32e6mr4077914eaf.47.1775926329262; Sat, 11 Apr 2026
 09:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260411022223.91029-1-fangyu.yu@linux.alibaba.com> <20260411022223.91029-2-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260411022223.91029-2-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 11 Apr 2026 22:21:57 +0530
X-Gm-Features: AQROBzBrpzfznEAFbbO-vdp8iuvh-4Q6CVGLr2K3uMPPDNj279HD1Tp5_HAL7qw
Message-ID: <CAAhSdy3azZ2hiO_zEC4-eu3EfHYeWJh5D5LfihYRkw-2XyYbQw@mail.gmail.com>
Subject: Re: [PATCH 1/2] iommu/riscv: Advertise Svpbmt support to generic page table
To: fangyu.yu@linux.alibaba.com
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	tjeznach@rivosinc.com, jgg@ziepe.ca, kevin.tian@intel.com, 
	baolu.lu@linux.intel.com, vasant.hegde@amd.com, guoren@kernel.org, 
	iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_095210_530899_CF774B49 
X-CRM114-Status: GOOD (  14.88  )
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

T24gU2F0LCBBcHIgMTEsIDIwMjYgYXQgNzo1MuKAr0FNIDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+Cj4KPiBUaGUgUklTQy1WIElPTU1VIGNhbiBvcHRpb25hbGx5IHN1cHBvcnQgU3ZwYm10
IHBhZ2UtYmFzZWQgbWVtb3J5IHR5cGVzCj4gaW4gaXRzIHBhZ2UgdGFibGUgZm9ybWF0LiBXaGVu
IHByZXNlbnQsdGhlIGdlbmVyaWMgcGFnZSB0YWJsZSBjb2RlIGNhbgo+IHVzZSB0aGlzIGNhcGFi
aWxpdHkgdG8gZW5jb2RlIG1lbW9yeSBhdHRyaWJ1dGVzIChlLmcuIE1NSU8gdnMgbm9ybWFsCj4g
bWVtb3J5KSBpbiBQVEVzLgo+Cj4gU2lnbmVkLW9mZi1ieTogRmFuZ3l1IFl1IDxmYW5neXUueXVA
bGludXguYWxpYmFiYS5jb20+CgpMb29rcyBnb29kIGZyb20gUklTQy1WIHBlcnNwZWN0aXZlLgoK
UmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApB
bnVwCgoKPiAtLS0KPiAgZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jICAgICAgIHwgMiArKwo+
ICBpbmNsdWRlL2xpbnV4L2dlbmVyaWNfcHQvY29tbW9uLmggfCAxICsKPiAgMiBmaWxlcyBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L3Jpc2N2
L2lvbW11LmMgYi9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMKPiBpbmRleCBjN2QwMzQyYWE3
NDcuLmU1Mzg4MzkzNTU2MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11
LmMKPiArKysgYi9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMKPiBAQCAtMTE5NCw2ICsxMTk0
LDggQEAgc3RhdGljIHN0cnVjdCBpb21tdV9kb21haW4gKnJpc2N2X2lvbW11X2FsbG9jX3BhZ2lu
Z19kb21haW4oc3RydWN0IGRldmljZSAqZGV2KQo+ICAgICAgICAgY2ZnLmNvbW1vbi5mZWF0dXJl
cyA9IEJJVChQVF9GRUFUX1NJR05fRVhURU5EKSB8Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgQklUKFBUX0ZFQVRfRkxVU0hfUkFOR0UpIHwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBCSVQoUFRfRkVBVF9SSVNDVl9TVk5BUE9UXzY0Syk7Cj4gKyAgICAgICBpZiAoaW9t
bXUtPmNhcHMgJiBSSVNDVl9JT01NVV9DQVBBQklMSVRJRVNfU1ZQQk1UKQo+ICsgICAgICAgICAg
ICAgICBjZmcuY29tbW9uLmZlYXR1cmVzIHw9IEJJVChQVF9GRUFUX1JJU0NWX1NWUEJNVCk7Cj4g
ICAgICAgICBkb21haW4tPnJpc2N2cHQuaW9tbXUubmlkID0gZGV2X3RvX25vZGUoaW9tbXUtPmRl
dik7Cj4gICAgICAgICBkb21haW4tPmRvbWFpbi5vcHMgPSAmcmlzY3ZfaW9tbXVfcGFnaW5nX2Rv
bWFpbl9vcHM7Cj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9nZW5lcmljX3B0L2NvbW1v
bi5oIGIvaW5jbHVkZS9saW51eC9nZW5lcmljX3B0L2NvbW1vbi5oCj4gaW5kZXggZmM1ZDBiNWVk
YWRjLi5kZmFkZjhhNTc1MmEgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9nZW5lcmljX3B0
L2NvbW1vbi5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9nZW5lcmljX3B0L2NvbW1vbi5oCj4gQEAg
LTE4OCw2ICsxODgsNyBAQCBlbnVtIHsKPiAgICAgICAgICAqIFN1cHBvcnQgdGhlIDY0ayBjb250
aWd1b3VzIHBhZ2Ugc2l6ZSBmb2xsb3dpbmcgdGhlIFN2bmFwb3QgZXh0ZW5zaW9uLgo+ICAgICAg
ICAgICovCj4gICAgICAgICBQVF9GRUFUX1JJU0NWX1NWTkFQT1RfNjRLID0gUFRfRkVBVF9GTVRf
U1RBUlQsCj4gKyAgICAgICBQVF9GRUFUX1JJU0NWX1NWUEJNVCwKPgo+ICB9Owo+Cj4gLS0KPiAy
LjUwLjEKPgo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2
bS1yaXNjdgo=
