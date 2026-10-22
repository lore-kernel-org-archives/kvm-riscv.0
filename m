Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB161606A319
	for <kvm-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 05:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TBEBXHa5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=dkXzrWF1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4nptDTqvUIsUaOgFKomSOOI9NFlLHhrjIz7FXGyzxNI=; b=TBEBXHa5tM1MG9
	c+gSEnNdJEMpjXvjSJKIdqdXPsQmygn/yrIfi7bQN8NdVVkFmNO6FHDOl+Uko4SjXOIvB722+Fsxq
	Td9jmMkACqFqafhn9qloiNAYQvB2hZsljMzj1D9S9TGDRA8uOR24GTSFTeI9ASK3BwH3Z39WXbWfx
	V0hMmtjMpyN6LgtW1uCA4DbCpK3+XygTrei54aWL3zDOH5oUe7tgCzhd6mzJOyU1lGbE0k9ZgBPWQ
	AXzyaLfACrsFHMrIKr/FweUjKSQIEYCn2Ena1ybCPv9wYinfwQNfMxVrINPwV99G8Bd9rx4CUg84c
	FgnKneWQ13JdBtIQ2nEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlfy-0000000DQ1I-0DQg;
	Thu, 22 Oct 2026 05:49:18 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlfs-0000000DQ0C-2DJo
	for kvm-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 05:49:15 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so10126645e9.2
        for <kvm-riscv@lists.infradead.org>; Wed, 21 Oct 2026 22:49:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792648150; cv=none;
        d=google.com; s=arc-20260327;
        b=oxv2XzHHZEFGKTii9PX/8cihU4zx8RKT/NG3TC7E8tNqHy5SDkVxYEroA3zredYpmp
         sfw3BPAnrTrTcIHCpT4i47nmEmYd6uycF15FMnIVHXWcnh5wblkJ6KHms3nZzLbUNpDZ
         3ya4gVHed2fBp9PxywLJE8jaVvmPtjkvIaJF5umvFzm0bidFuXvWfUsl+I+1kwenNVZ7
         gUFvW7crHb9Cdi654EnkdBfuiIxAg/xO/jaBPXx2nObEtmW8EBTAH0uhBadUpyi75JDn
         95LFQk6cuZ4TDDtyrJKjyECCgfEnDvWF7ZaVjnO+UjtTMEjK+0rj5g3nA0slPQXVLwfX
         15Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OLwqPe6nKylyfAeT1HYsvD0areP6du4KRg580T8M6Fc=;
        fh=kF1uYwCirDM3OlfX5FzyPwgF3M+SIy7+A+uuN6xZV9U=;
        b=iDjwbnOblIWNHIJ3SFtVkk0Ffp5a0GNBvtkQzTWYvyrh6up1uB+qOFLnSUH5NuSckb
         nROtlkdxPPNk9MgPOpRXaRAiuDLnBs/Eq2xxOBMR6lP3FEhJS6bts92kzEOm4jQkrkTw
         HT/mWjQe0zvZVZ+/UgzMYSCM4xHNq/ViroBqpMjOxPkeuqQ37ai9dpYCkSdLWlz2Ohhp
         tv0eqF0FHn3HBF2GI0/zNYGaU7sau1/rvINZt5UuAyckKrbVlGiouZ5DGgFNA6SdKdGt
         oeX5KXRG7Q+6VeukrtdsicNN8hJHX2jDvugcmxD1Bwq43QT3zJ1Za0FccAtXX+hZ+6aU
         QDnw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792648150; x=1793252950; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OLwqPe6nKylyfAeT1HYsvD0areP6du4KRg580T8M6Fc=;
        b=dkXzrWF1JRdlRmmt4905cJ9Ytf0kPNpr8wsvy9vqf5Gue0xN2R+LU31jCv35/nleZd
         wRKtwOoU5C7bdMzf6NOBcLpesAeO5OGs8xKiA4Fh1bL9H53OPVjUm8GCBNOELGfE0WUr
         psJxoNjpKTPE0QHWuIi+u0cs8Z+ixowTjfbmKC05t2Y+/bPhDAKg3u7PwKZosnKx1LZp
         74kNoT3kFI/4mTqYEG6AT88in6azrPwLPMIhhziDp0LYNBAbn34VJg+UuyJ1i96CiRTN
         qnfYtC9dUmRK2AsXMxyyjZy4JHzz8ACt5GZ+ES71cAyKd2DWl0wwg/pUqPdmxpAP4o8I
         NrZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792648150; x=1793252950;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OLwqPe6nKylyfAeT1HYsvD0areP6du4KRg580T8M6Fc=;
        b=LdKKO7pSr1+vMrFclYMfun9raeeLC/w9aO2cgzNKrscRkRMQuYiAdjsQv3qosxjZGQ
         9W1woFO7FP9VyUCaKlSWpuf5qCHeeXrhC+Oj1i0NNtZuYikva3ipgWp3FFRH7XXvSiw0
         kULhE0QetScFtmiRBtrHvu++UW8bJNoj2xFdGXtA+ZSxe6zmYPmovk42vGFdzQGOyWzi
         i+LFHNK5T8B9E/gxb0uVFeLFpse+ei6K6/AVOzTZQUOS3Fwgb2gzPD4Edrwe0K8IteSd
         TSb78kn1rb4y2Cva/qlllbWijddJuPJ+0Dlc8xb/blqtPCsRw0zSCLFWaRjA9qvoiOHr
         LGYA==
X-Forwarded-Encrypted: i=1; AKwUvBwOwAF6IEulMBX2sIji8HAWRB3hrNNw7pMuOgkDttxaMxQNdX/ErvSrVn4dBsRLwW7kDigtmPm4Cxw=@lists.infradead.org
X-Gm-Message-State: AFq9FYKQWaEbuWM34rijMrFdzBpZ8c/RGHDji0SSM21tNwG5MCzZnEQR
	LzUs4rQgxVev51FfmvohhsyBF7RAT5gaBPix1gAbNXLqyT+oXKdzCuVjimdgHUS5EpYJ3hroEm4
	MarVM3yslycXOzRW6bPca3BrhF6cprfgmmHgUL3ZVGw==
X-Gm-Gg: AYBFou22ocPXMXBKmSEoXoV5W2UsqQ+3nhgSX+IzNDn4zRZsBzOUtdwX4vNUnRGdeko
	1mUBS3M/cKckkk9BHYBarIQUtea7WhoZJd9SUytaTaxsfMo8/Dxw/r2xd7kP374FZ9/4dK3/J20
	Zq36IKkyE5mmbX0fCOdNms9flWqtss/6FlGVHen+kG/1/xEVob57GeI3v8Q21z/kNTWIlkKxqSu
	MFIjS1uv2HyNJusNECpkwtYAY6ZrZRiWRuasm+U5CDOfpIbufFrZKP9QsQokF9PH/WGstDY7L+z
	QIx/WOgJEwHQM6kt0+e5AWGBN06l2TbGC+ufgR3Vg6JbyPG/pMTMhbz0k1R9WAyI7nFPcZTcEMZ
	xcLMMhPldUlOEwKbHOAkQrfKNbOvVo469EFQjY6Wt88t6cStTIDPx21PGp7Eh0BNekjA8Kvk2pL
	GU/C1bIofY9rdTOb3K4l2mIGKI1qdJN5VDgpB2QFLlH2wzswR+6PtjmUXr
X-Received: by 2002:a05:600c:34ce:b0:4a1:dbdf:17a8 with SMTP id
 5b1f17b1804b1-4a1fd8a7d77mr86271145e9.2.1792648150526; Wed, 21 Oct 2026
 22:49:10 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260926055227.3678332-1-matthias.goergens@gmail.com>
In-Reply-To: <20260926055227.3678332-1-matthias.goergens@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 22 Oct 2026 11:18:57 +0530
X-Gm-Features: AclHuK8thstWF5FcOG66PqU0xPPPqsryWezn1ub_Gddpp_AR2RhbRXCk-tq945k
Message-ID: <CAAhSdy3ongNF4xkLXYjEc=jNyn+=KT1soH-kPNY=5wZdoad0RA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: name the kvm-riscv/linux riscv_kvm_next branch
To: Matthias Goergens <matthias.goergens@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_224912_581014_CC3E3C36 
X-CRM114-Status: GOOD (  16.89  )
X-Spam-Score: -2.1 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU2F0LCBTZXAgMjYsIDIwMjYgYXQgMTE6MjLigK9BTSBNYXR0aGlhcyBHb2VyZ2Vucwo8bWF0
dGhpYXMuZ29lcmdlbnNAZ21haWwuY29tPiB3cm90ZToKPgo+IFRoZSBUOiBlbnRyeSBmb3IgS0VS
TkVMIFZJUlRVQUwgTUFDSElORSBGT1IgUklTQy1WIChLVk0vcmlzY3YpIG5hbWVzCj4gZ2l0aHVi
LmNvbS9rdm0tcmlzY3YvbGludXggd2l0aG91dCBhIGJyYW5jaC4gIFRoZSByZXBvc2l0b3J5J3Mg
SEVBRAo+IHBvaW50cyB0byBicmFuY2ggbWFzdGVyLCB3aGljaCBtYWlubGluZSBhbHJlYWR5IGNv
bnRhaW5zLiAgbGludXgtbmV4dAo+IG1lcmdlcyB0aGUgcmlzY3Zfa3ZtX25leHQgYnJhbmNoIG9m
IHRoaXMgcmVwb3NpdG9yeSAoTmV4dC9UcmVlcykuICBOYW1lCj4gdGhhdCBicmFuY2ggaW4gdGhl
IGVudHJ5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogTWF0dGhpYXMgR29lcmdlbnMgPG1hdHRoaWFzLmdv
ZXJnZW5zQGdtYWlsLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBi
cmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC03LjQKClRoYW5rcywK
QW51cAoKPiAtLS0KPiBUaGlzIGlzIHBhcnQgb2YgYSBjbGVhbnVwIG9mIGFsbCBUOiBlbnRyaWVz
IHdob3NlIHJlcG9zaXRvcnkgSEVBRCBpcwo+IG5vdCB3aGVyZSBkZXZlbG9wbWVudCBoYXBwZW5z
OiBvbmUgcGF0Y2ggcGVyIHJlcG9zaXRvcnksIHNlbnQgaW4gc21hbGwKPiBiYXRjaGVzLiAgVGhl
IHBsYW4gaXMgYXQgWzFdLCBhbmQgd2h5IGl0IGdvZXMgb3V0IGluIGJhdGNoZXMgYXQgWzJdLgo+
Cj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDkyNDAzMzIwMC4zNjE1NTU0
LTEtbWF0dGhpYXMuZ29lcmdlbnNAZ21haWwuY29tLwo+IFsyXSBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyNjA5MjQxMDE4NDQuMjQwMzAwOC0xLW1hdHRoaWFzLmdvZXJnZW5zQGdtYWls
LmNvbS8KPgo+ICBNQUlOVEFJTkVSUyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlO
VEFJTkVSUwo+IGluZGV4IDE0MGVhZmNiYmQ3OC4uMTZmNmIzMDZhZGYyIDEwMDY0NAo+IC0tLSBh
L01BSU5UQUlORVJTCj4gKysrIGIvTUFJTlRBSU5FUlMKPiBAQCAtMTQzNTcsNyArMTQzNTcsNyBA
QCBMOiAgICAgIGt2bUB2Z2VyLmtlcm5lbC5vcmcKPiAgTDogICAgIGt2bS1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCj4gIEw6ICAgICBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4g
IFM6ICAgICBNYWludGFpbmVkCj4gLVQ6ICAgICBnaXQgaHR0cHM6Ly9naXRodWIuY29tL2t2bS1y
aXNjdi9saW51eC5naXQKPiArVDogICAgIGdpdCBodHRwczovL2dpdGh1Yi5jb20va3ZtLXJpc2N2
L2xpbnV4LmdpdCByaXNjdl9rdm1fbmV4dAo+ICBGOiAgICAgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9rdm0qCj4gIEY6ICAgICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtKgo+ICBGOiAg
ICAgYXJjaC9yaXNjdi9rdm0vCj4KPiBiYXNlLWNvbW1pdDogNjJmNGM5OThiMjk3Y2YyMzM5OTdh
MmI0Y2Q2ZmMyZDJkZjAzMTljOQo+IC0tCj4gMi41NS4wCj4KCi0tIAprdm0tcmlzY3YgbWFpbGlu
ZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
