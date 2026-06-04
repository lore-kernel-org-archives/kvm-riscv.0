Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A615CD6E4A
	for <kvm-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 07:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k25NvepaF+J2FD0Hjj0Rp8nFg3Q4HkvrlkoKfEV9lvk=; b=x45ZyoRjfGayVH
	4DawU0AbfKi1um8AV0NCtfBT/tfIFqoVW59f6YarKBVfKLFh0CDA+Se0OjNYW233l4R21GZ5LQO1o
	hAz/+c193zI6XP+IJ63HQBZkVx/EFUfZwKF/CeYkDrrfdUayyGiQzcuOCj4cRc2wX1dtG27iiEFq+
	1ZCIK0v51YnFlnXys2ONulrUFZU9Qdx8g2QC/gdbPzRFLbFHZLUaKnzzxhaND3S+WcZP9DUQk9FOs
	s6XsGMuUvy0bCdJLh9tR1Ildkg6cwG4xhuGiWHjSw2d2/mU9uQKB5Fwh9VoqPfBhD7Uf26fdjy6u4
	2eOyVrnpGZ2hJZJNhuDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2sz-0000000GL4y-30uG;
	Thu, 04 Jun 2026 07:53:05 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV2sv-0000000GL2c-21AN
	for kvm-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 07:53:03 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-7e6cee520ccso313231a34.1
        for <kvm-riscv@lists.infradead.org>; Thu, 04 Jun 2026 00:53:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780559580; cv=none;
        d=google.com; s=arc-20240605;
        b=WHtiUV+ufoa5Ii3eeDdUdEEJ3o2mG6xpsYODzdp4TfbX7DfNuUpL/EFS7YGc8LFXSV
         AQfTgQk40cXBxQCbLTrh2KjZuWDwHh8KrMxjHjlKoeMoNkZqconJwh3fhIy20JZeF0IB
         DHOlnaFIlHL2hvcvRSiSVAHktCIakBFKp7nmm537V4vZZxr/bd5nTySnIt4Hr+gZ8vup
         fGUoM0ygdnVp6Ld5J6gIkbOVkUP+ckivJaa2Dk21hkTEHCVCqm+nIU/juyZMcbdN/Lhy
         +qmInWNxBGWF1FME+EmFwkcPjPtbaAFBUnwlQjLUBDZL+S6EID3vhhyuAsOpHgNl0zzi
         ngnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OqAVryQ+sSJ2qvei7sWyBycSvMmltoGs0O/9YnbcysQ=;
        fh=SRf6ejESxor+WaYRQSNSqYImcJ3EJB7kPfeaV4tYG10=;
        b=FaF5fM0fYzQcucFNuSlYXUmPwzu/6VU+vTrEuXIAQRPiN2fKXoM2YaCK4pKJdcbAYt
         Dy/EEa0xHm/WDUB3jAY3mkR2POiedSyxMinPanzZIRqNZ6iFrbWL6JjgS5VaRstKMjMx
         T37JipZ5ks2wIMKMHN71lFtByX9r3pbguiolr1o8HWzb94zzpsQwenjNSbhNg+te2G6d
         p6nhnrfavgDAIyzwiFCd1lIyVXGV7McP+6wzKkMvBLuW9ITKzAFoHrEuGDbzQ4O/yaRp
         RogxvyY2g/xUHpzLLMP6pvihjEH62/RbOriWe+Qmngou3rIdVxXPsIZzlirYxhkAnF/7
         PMMA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780559580; x=1781164380; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqAVryQ+sSJ2qvei7sWyBycSvMmltoGs0O/9YnbcysQ=;
        b=qa9xY3h+uPl0j89WLnr6MnnYB6ZBp0Z8qOAccYSp8bQGnRsPUoYtg7s/dwwh/U4vNx
         2m/rm1hNRztNtXQJgoAbgf1p9ojuSb1oul++FgeiJbYxocay9GPX8z8DPsFZs4pIAuCJ
         C++xr2q9oZb0FQTUNxCWUV2NbPwkmS9fL3I7bSs/wZu0w5TAbu9OkMvf5v9gSlZVoDcx
         3K84Y3ybEMgmBzNmUTKQbMvft/HuTezd2vfGbutVk/2r5YDdAYX6W5FcLNGQktt9g4vQ
         u0taNp0ODj7WRCa/27CTUzLdQtoqc0tcDp3Bbn5wLagezsQTXtZ2oR85FFAaTEnUZQVS
         gQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780559580; x=1781164380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OqAVryQ+sSJ2qvei7sWyBycSvMmltoGs0O/9YnbcysQ=;
        b=aLOn8Vs5Z6eJq4H4kZqHQlLXqzK3VwZJ1byHBVLNIE9pRUQiHFr9bxdCHqTgoFdcqe
         asj90AjdrtCn6HdeSSg6/Q6Ks8i8bnLh0RUsE4F3PSNcg7iUrS58jfeHuMn1Rhm4qYbU
         valegNOWu2v/j8AOBqcXbVG46EaC7CdZoh8UMNYe5727lKbhTA/qOcALeDJ/5NZdIP+8
         OLff6+kivmsqAkEr84R6snUCKGVNbQ8RSYGj3g2q2C/MndAaXvAI7gFgWb2bnaqBf/zo
         6K4nP7fM2n6lY4NAqx/vYZG/j4rB5H4yi6L8pOj4LPnD5NRCjbHUoUKuL4yJgUTg7YiB
         0KUg==
X-Forwarded-Encrypted: i=1; AFNElJ/XCfQo+IfVt1zK8tCwTUFdbLurNPQml2pv9lQQQwipf0WuSCeBXrHC2Xy95UN6NIF+WsWPOIQSkec=@lists.infradead.org
X-Gm-Message-State: AOJu0YzXgb0HFyW3TcsfDlyj+8JTRN7U5/zXdDQ+97vi3/U8IoNAwPqa
	b0rUgZaIBjdh/yYSkGXOGbVmo97soJ4lntOw1fpkBuIsYF3Hn9ag2tNwycJNuFRS63My6x68Zc2
	DkYAZnTiTylrIph5XTiPa5MK3Gs4JOGTL0//joYL/lg==
X-Gm-Gg: Acq92OGDwdikWQJxKS5tBcQyQeTWVv4rDdd0HGFRdOel4DnSfn00RpJRd+H+HWnTkeW
	Mu5mFLdLyySICCK/rNml7wYgltVB+Y7HcLalmvT7YQ7EzeCEHToSk0MOES9dSnnXrb/oeDozQPL
	ypPHOTspWJyOQ0gdWyZwbxUU2/Ca+QkkPVA9Tc4+QYkB7KQHESOnpnB3+nEmtgXkSPPsQE6dedB
	G1EyL6mNtDPiqLSZr558oBqIZnQNfrRxdOHGWtCL/eGfwdl0+9iA4SI7qaS0DXcBaWUlmjHc3wO
	uLcGPsQTzLaCNo2Wdslm9tjp9A3a34fo1YCbCb9WuVjec/MZ7lQeYemkJg4r5/loHWEkY8u4aR+
	k9kI7E5HWKp1FeN/gnNOM3hr/kGWk6GB9PgAOXTj25KANkMY=
X-Received: by 2002:a05:6820:180a:b0:69e:8d4:28b8 with SMTP id
 006d021491bc7-69e590bafefmr1397926eaf.32.1780559580298; Thu, 04 Jun 2026
 00:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260526075544.796396-1-maqianga@uniontech.com>
In-Reply-To: <20260526075544.796396-1-maqianga@uniontech.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 4 Jun 2026 13:22:49 +0530
X-Gm-Features: AVHnY4IC89pVbBq6__qpDj1Dq7LuA6tOCD1DQTi9OxR8RUuRHdUDSjYF2_D39Rc
Message-ID: <CAAhSdy2GwXZ+qDdnNYe6Ykunvoa8-okQepxBNffGMFXu0U8Mig@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix timer state restore
To: Qiang Ma <maqianga@uniontech.com>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_005301_774931_A43A3A79 
X-CRM114-Status: GOOD (  17.02  )
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

T24gVHVlLCBNYXkgMjYsIDIwMjYgYXQgMToyNuKAr1BNIFFpYW5nIE1hIDxtYXFpYW5nYUB1bmlv
bnRlY2guY29tPiB3cm90ZToKPgo+IFRoZSBLVk1fUkVHX1JJU0NWX1RJTUVSX1JFRyhzdGF0ZSkg
b25lLXJlZyB3cml0ZSBwYXNzZXMgdGhlIHZhbHVlCj4gd3JpdHRlbiBieSB1c2Vyc3BhY2UgdG8g
a3ZtX3Jpc2N2X3ZjcHVfdGltZXJfbmV4dF9ldmVudCgpIHdoZW4KPiByZS1lbmFibGluZyB0aGUg
dGltZXIuCj4KPiBUaGF0IHZhbHVlIGlzIHRoZSB0aW1lciBzdGF0ZSwgS1ZNX1JJU0NWX1RJTUVS
X1NUQVRFX09OLCBub3QgdGhlCj4gdGltZXIgY29tcGFyZSB2YWx1ZS4gRHVyaW5nIG1pZ3JhdGlv
biBvciBzdGF0ZSByZXN0b3JlLCB1c2Vyc3BhY2UKPiByZXN0b3JlcyB0aGUgY29tcGFyZSByZWdp
c3RlciBzZXBhcmF0ZWx5LCB3aGljaCBzdG9yZXMgdGhlIHRhcmdldAo+IGN5Y2xlIGluIHQtPm5l
eHRfY3ljbGVzLiBSZS1hcm1pbmcgdGhlIHRpbWVyIHdpdGggdGhlIHN0YXRlIHZhbHVlCj4gc2No
ZWR1bGVzIHRoZSBuZXh0IGV2ZW50IGF0IGN5Y2xlIDEgaW5zdGVhZCBvZiB0aGUgcmVzdG9yZWQg
Y29tcGFyZQo+IHZhbHVlLCBjYXVzaW5nIHRoZSB2aXJ0dWFsIHRpbWVyIHRvIGZpcmUgdG9vIGVh
cmx5Lgo+Cj4gVXNlIHRoZSByZXN0b3JlZCBjb21wYXJlIHZhbHVlIGZyb20gdC0+bmV4dF9jeWNs
ZXMgd2hlbiB0dXJuaW5nIHRoZQo+IHRpbWVyIGJhY2sgb24uCj4KPiBGaXhlczogM2E5ZjY2Y2Iy
NWUxICgiUklTQy1WOiBLVk06IEFkZCB0aW1lciBmdW5jdGlvbmFsaXR5IikKPgo+IFNpZ25lZC1v
ZmYtYnk6IFFpYW5nIE1hIDxtYXFpYW5nYUB1bmlvbnRlY2guY29tPgoKTEdUTS4KClJldmlld2Vk
LWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0Y2gg
Zm9yIExpbnV4LTcuMgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1
X3RpbWVyLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfdGltZXIuYyBiL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHVfdGltZXIuYwo+IGluZGV4IDk4MTdmZjgwMjgyMS4uYWU1MzEzM2M3
YWIwIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfdGltZXIuYwo+ICsrKyBiL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHVfdGltZXIuYwo+IEBAIC0yMzEsNyArMjMxLDcgQEAgaW50IGt2bV9y
aXNjdl92Y3B1X3NldF9yZWdfdGltZXIoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ICAgICAgICAg
ICAgICAgICBicmVhazsKPiAgICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9USU1FUl9SRUcoc3Rh
dGUpOgo+ICAgICAgICAgICAgICAgICBpZiAocmVnX3ZhbCA9PSBLVk1fUklTQ1ZfVElNRVJfU1RB
VEVfT04pCj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0ga3ZtX3Jpc2N2X3ZjcHVfdGlt
ZXJfbmV4dF9ldmVudCh2Y3B1LCByZWdfdmFsKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBy
ZXQgPSBrdm1fcmlzY3ZfdmNwdV90aW1lcl9uZXh0X2V2ZW50KHZjcHUsIHQtPm5leHRfY3ljbGVz
KTsKPiAgICAgICAgICAgICAgICAgZWxzZQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9
IGt2bV9yaXNjdl92Y3B1X3RpbWVyX2NhbmNlbCh0KTsKPiAgICAgICAgICAgICAgICAgYnJlYWs7
Cj4gLS0KPiAyLjIwLjEKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9rdm0tcmlzY3YK
