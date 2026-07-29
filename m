Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F4FC53219
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 16:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TFLRtbMoc9yjT3hh0NAH5YCYOJQbinQzTu6K0wceVaQ=; b=UISzIthSK26SEh
	G7qDA1iInvBwlxzmsGpdhfDsWMu4cb2OjI5Srj/8EPDYNyw5XimOsTYbOAJEC2un8ingMTv/jzUIx
	X/7/VN8kTDhLeZOWqbDa3giSvq1gQjfeIYDR8QLDNeegwefUHLe+yBx+I/ECnPESujEpXw9dNCH3z
	cQYgWEmjs5v1G8M/UthBgjzvSaAwEL3kql8DxW0NPRgJeK39fRS2AsIyGa3M54k2ynfpxW8FaQHWR
	kDd9zkAw+2PcGZb6buReVP+UE1+b3J2NYOs4LKHN6jW3TgGQcj54Rr7EpZUUPsz1MiplZoAf0yutE
	OjZG2EoWdDBRtV8D87TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6ng-00000008Umx-0Pve;
	Wed, 29 Jul 2026 16:06:32 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6nc-00000008Ulw-3y1v
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 16:06:30 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso8472345e9.0
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 09:06:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785341187; cv=none;
        d=google.com; s=arc-20260327;
        b=BwwgCFIpERHMUrSCbSBWb8A7edlAtb0Bw/dTc1CD3ByDvQt93K9/LceZiqMPAheiMv
         VuWsUPtFlS0xqbhe9KryealF2BlmdS5bb/5rjQ4TJn5Roo7Ig9dM7L+bMwKXaHvkNbPe
         pFRHnMNsVnm5f0i+hjFbb+BH1wmCxOXOz7Dnbqwyo858/Uun9ALQfFHOBChZchZXYabV
         sIC+GTLAjgym8RFYhpGGH0HUnLL1hC11CJRf00tlb+MmkiwQRo/wuj9Kr3M4gTvxZ4Sf
         Z8ZIZOnHz6xdcXoVoQ81ZDb4iRt8AcTBXXBZ/ufbkp/GOQxWM9E1dg+y/FlxDnlQ0CdS
         4fqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PZCxNpAkNUCXAcRdhLTO0d6tb8+6Q3Nj0sfDnYlByPI=;
        fh=eYin4FO5LmKo7q7D89qCIU7KkIBNaepFjxVS8/YTl4k=;
        b=odCFlOLbOGoNQnwkzxQKhcz1slO7pUjHBo7K7FIjFdlWBxIlkQES8nySsAanES9LnX
         xBxK/odXSQpgYxQy4rlJA3IElD/qa2ZyK0ChGsiKTIWQolmeWoXgpGHiTp+USvJ0Tt0X
         LCQeIon73bWfGhIOSDf8d6HRTZIP92DWwGuj/qsY+ef8LWiTSx+Tp5+VBSKZr+9BcT2D
         eV3xt07nvUrACCho4pzh64TnWkAtKOHFZu2/3U8mlpwwJTbCtZJHLwuv+qTqQMRUKEBq
         c/5vnZclsDa6aDxhLakKjcfHTZH3VyzOMhh9OycDJh2z5ryzaXen2pGq1eqT6RMRgK/t
         tfAw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785341187; x=1785945987; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PZCxNpAkNUCXAcRdhLTO0d6tb8+6Q3Nj0sfDnYlByPI=;
        b=LbUDYPv+4r0GlD0/cLDUn5ToKQ4jIrEeOu9mY6j7a+FF0lUt47d6uVrm1MNUMSqkuw
         sB50MTeZFNdUA39AEO0cTDZ6irIX/T0QpGaKDj0OYsb6fmBA8GFeHpDS3LeZZtnDWpH1
         iAXOha+pvZyW2QWzkfeDHtrWDg2kTtpbJgnqcBzTWN4b/zV9mUE7SEfMqUG+R10FAfC9
         GiZ5CucoB8h5T2ZesiKwQwMpSv8AlZWvKV20ioGfv8nUXHW1honZvarGcRVriBB8srl/
         ye+rqW+Awlrr8XDzlyLyIIT0Fr90Jc5TgKr1uS654JDlj62al6VzC3fNj24+yY072gvI
         FPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785341187; x=1785945987;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PZCxNpAkNUCXAcRdhLTO0d6tb8+6Q3Nj0sfDnYlByPI=;
        b=JLZg1fafPqZED5pKA/KeleZyDseJhxzbJxtDd2U9HcPpCCvy6bQZK2BLUtM69LCQx5
         fEru9WzJ72hOzolLlzIWTUI1grAEsQVk50/UNTQTEwyXpp3doTjqLxy+6Btwp1XnkHEg
         4NeLgdaTAVqCKlB+kiGSFdmzie3exDHm/bAbrhmKXICURFKGO0ifaTY30a77eBbfcFmP
         r1IJ/3agUzkryIKaiBEe+q5tD5klGe0VoqqqaP9mMzL8UgZiNxerr+mRZQ8cJEBPDB5n
         C4216Ra2wm1oARVeuKTqIzhyBdGScjzxdgY9z8SVcr+gPoUG/0r5FCBM8WVotyX6nfd0
         NBGg==
X-Forwarded-Encrypted: i=1; AHgh+Rqnh9EOHUAcc34GieuXpIJT8viq68RrsyiPWazWPV/PW+tfZ+cUWpoDmij+48EavwHVVJwAf0eu7Pk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwX8snTj5NJADkqH/HmFiX5k6Wx2Ey8zNUdldCIjifDQMkyk1ec
	BE0xss2gfIKBR/IQtuFUcfuof/oUuQso+HIMP6DWazIWiJAUGeF3A9M4pCkHqmkBTuRUNfUtmex
	Ix1gqirCi0FDK/liBUNpk3enuH7w7cNT7CpYULQlM6g==
X-Gm-Gg: AR+sD12b7NFFXwg5BtGlDUhodSqspzR0uxydnsS70BLThtli5yeWNdphEO+SSajGaz9
	nvtxtUUR2FDdJmB0NgUsMDcbhHSUcqKGl+4wOoxMcbJIOQlSgVsznF24+N7u0tUzBq1qJg4vyOy
	3olLYMKB7TjGVQP0ec+53hwnSta+FViOZGA/7GQsD8aXQboq7NLDfXRFW5Z2402F2Rssp+RkNzh
	6Fo/ArpULT+rCTqPJI/GEaLFw6tsfl8+0RA1p2b4st/X09hcp3Uh4FyPQlYOu44F0Fwrc6WCIbs
	hchdmexQiRQ20SSfQ7b5RoZSaKRBVc9K9Lyu4Gjkj+bavuqlm8kwpMTo6j150uZA9F19c5krmAS
	vQ8fsr2xN04JbDYePiQvy7u+/ymhtugKXh7M0D7QcbFXZkkJWFBNFbhzaCYExlk9k
X-Received: by 2002:a05:600c:8b2e:b0:495:6e68:39bd with SMTP id
 5b1f17b1804b1-496c6597a0fmr96285485e9.28.1785341186425; Wed, 29 Jul 2026
 09:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260729075230.743030-1-shanbeeyoo@gmail.com> <20260729120733.829457-1-shanbeeyoo@gmail.com>
 <20260729120733.829457-2-shanbeeyoo@gmail.com>
In-Reply-To: <20260729120733.829457-2-shanbeeyoo@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 29 Jul 2026 21:36:14 +0530
X-Gm-Features: AUfX_mwiSOUOFP2TPHe4Inq1CQye-PgTV4ubVFK-FDwozFalkW3VgzVL7PEKoxM
Message-ID: <CAAhSdy3ziS_1iiUjC5HSVqX9iMgckyS7Yro=xwZyomxXC=MC7w@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] RISC-V: KVM: Treat -EEXIST from G-stage map as success
To: "Bingyu.Xian" <shanbeeyoo@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Quan Zhou <zhouquan@iscas.ac.cn>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_090629_096185_0BEF6E3F 
X-CRM114-Status: GOOD (  21.63  )
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

T24gV2VkLCBKdWwgMjksIDIwMjYgYXQgNTozN+KAr1BNIEJpbmd5dS5YaWFuIDxzaGFuYmVleW9v
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBXaGVuIGEgY29uY3VycmVudCB2Q1BVIGluc3RhbGxzIHRo
ZSBzYW1lIEctc3RhZ2UgbWFwcGluZyB3aGlsZSB3ZSBhcmUKPiB3YWl0aW5nIGZvciBtbXVfbG9j
aywga3ZtX3Jpc2N2X2dzdGFnZV9tYXBfcGFnZSgpIHJldHVybnMgLUVFWElTVC4KPiBUaGlzIGlz
IG5vdCBhbiBlcnJvciAtLSB0aGUgcGFnZSBpcyBjb3JyZWN0bHkgbWFwcGVkIGFuZCB0aGUgZmF1
bHRpbmcKPiB2Q1BVIGNhbiBzaW1wbHkgcmV0cnkgdGhlIGd1ZXN0IGluc3RydWN0aW9uIC0tIGJ1
dCBLVk0gd2FzIHRyZWF0aW5nIGl0Cj4gYXMgb25lOiBwcmludGluZyAiRmFpbGVkIHRvIG1hcCBp
biBHLXN0YWdlIiB0byBkbWVzZyBhbmQgcHJvcGFnYXRpbmcKPiAtRUVYSVNUIGFsbCB0aGUgd2F5
IHRvIHVzZXJzcGFjZS4KClRoZSBrdm1fcmlzY3ZfZ3N0YWdlX21hcF9wYWdlKCkgcmV0dXJuIC1F
RVhJU1Qgb25seSB3aGVuIGEgbGVhZi1QVEUKb2YgaGlnaGVyLW9yZGVyIGFscmVhZHkgZXhpc3Rz
LiBJdCBkb2VzIG5vdCByZXR1cm4gZXJyb3Igd2hlbiBsZWFmLVBURSBhdApzYW1lIGxldmVsIGFs
cmVhZHkgZXhpc3RzIHNvIHRoaXMgaXMgYW4gaW52YWxpZCBmaXguCgpSZWdhcmRzLApBbnVwCgo+
Cj4gQWxpZ24gUklTQy1WIHdpdGggeDg2IGFuZCBhcm02NCwgd2hpY2ggYWxyZWFkeSBzd2FsbG93
IC1FRVhJU1QgaW4KPiB0aGVpciByZXNwZWN0aXZlIGZhdWx0IGhhbmRsZXJzLiAgVGhpcyBhbHNv
IGxldHMga3ZtX3JlbGVhc2VfZmF1bHRpbl9wYWdlKCkKPiBkcm9wIGl0cyAicmV0ICYmIHJldCAh
PSAtRUVYSVNUIiBzcGVjaWFsIGNhc2U6IHdpdGggcmV0IG5vcm1hbGl6ZWQgdG8gMAo+IHRoZSBy
ZWd1bGFyIHJlbGVhc2UgcGF0aCBpcyBjb3JyZWN0Lgo+Cj4gRml4ZXM6IDlkMDVjMWZlZTgzNyAo
IlJJU0MtVjogS1ZNOiBJbXBsZW1lbnQgc3RhZ2UyIHBhZ2UgdGFibGUgcHJvZ3JhbW1pbmciKQo+
IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gQXNzaXN0ZWQtYnk6IFl1YW5TaGVuZzogZGVl
cHNlZWstdjQtcHJvCj4gQ28tZGV2ZWxvcGVkLWJ5OiBRdWFuIFpob3UgPHpob3VxdWFuQGlzY2Fz
LmFjLmNuPgo+IFNpZ25lZC1vZmYtYnk6IFF1YW4gWmhvdSA8emhvdXF1YW5AaXNjYXMuYWMuY24+
Cj4gU2lnbmVkLW9mZi1ieTogQmluZ3l1IFhpYW4gPHNoYW5iZWV5b29AZ21haWwuY29tPgo+IC0t
LQo+ICBhcmNoL3Jpc2N2L2t2bS9tbXUuYyB8IDYgKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rdm0vbW11LmMgYi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+IGluZGV4IDhhMGFhNWUwZTIxNi4u
OTQzZDhkYzcyMTA1IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gKysrIGIv
YXJjaC9yaXNjdi9rdm0vbW11LmMKPiBAQCAtNjUyLDExICs2NTIsMTMgQEAgaW50IGt2bV9yaXNj
dl9tbXVfbWFwKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAq
bWVtc2xvdCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB2bWFfcGFnZXNpemUsIHRydWUsIHRydWUsIG91dF9tYXApOwo+ICAgICAgICAgfQo+Cj4gLSAg
ICAgICBpZiAocmV0KQo+ICsgICAgICAgaWYgKHJldCA9PSAtRUVYSVNUKQo+ICsgICAgICAgICAg
ICAgICByZXQgPSAwOwo+ICsgICAgICAgZWxzZSBpZiAocmV0KQo+ICAgICAgICAgICAgICAgICBr
dm1fZXJyKCJGYWlsZWQgdG8gbWFwIGluIEctc3RhZ2VcbiIpOwo+Cj4gIG91dF91bmxvY2s6Cj4g
LSAgICAgICBrdm1fcmVsZWFzZV9mYXVsdGluX3BhZ2Uoa3ZtLCBwYWdlLCByZXQgJiYgcmV0ICE9
IC1FRVhJU1QsIHdyaXRhYmxlKTsKPiArICAgICAgIGt2bV9yZWxlYXNlX2ZhdWx0aW5fcGFnZShr
dm0sIHBhZ2UsIHJldCwgd3JpdGFibGUpOwo+ICAgICAgICAgd3JpdGVfdW5sb2NrKCZrdm0tPm1t
dV9sb2NrKTsKPiAgICAgICAgIHJldHVybiByZXQ7Cj4gIH0KPiAtLQo+IDIuNTQuMAo+CgotLSAK
a3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
