Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB20CD6E4A
	for <kvm-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 05:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JO2lvw0+Yb2Qt8sO3sMXfQk0EtZTGxPo/cZHCohwyU8=; b=b40jjYXobR5S4I
	R1WwaI3FewrisPfI+t1dMX3P1av4HYd3R1NKkx12XFwHSGi97RRBC1zrwmP2RZc5216rik1nXGDI8
	lUWZpAZStgZklMF5Xp7/3AzXa6gpCOoEzh2hLHHNDO1T21ndzm++0SF6t+fAmvGNVuzjWuSHFStFA
	y4mkLSVXA0Q2/Y0w/pS0u0jzAF594uqSd0I/T1bTacDuO1uMlEOfrbd8cjxP+Py6V4C1VztHBdsSe
	YBP6FFRWv4H/4LqsJD22Gph6xK9Jl350FA2Hnt0JSM+cpUIklN3iwZdf25bVPGqPMQ7fWh3W2Ost2
	kJY08VicfrQohB6x6YSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV0x5-0000000GCI7-1QaX;
	Thu, 04 Jun 2026 05:49:11 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV0x2-0000000GCH9-0g9s
	for kvm-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 05:49:10 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-5176fc0cc72so3904201cf.1
        for <kvm-riscv@lists.infradead.org>; Wed, 03 Jun 2026 22:49:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780552147; cv=none;
        d=google.com; s=arc-20240605;
        b=U80oO2HfiMw8jIvZPbVGi7EfUmzy2BSa4LnKOzy6n6meUO3CxoeqjdK+vw69VrWAJ9
         pLrEKiO+Gf4vG8saQy2uTUB5p52qtkrWARvtXMJxzPdsJOHBfZckUafrBWsvjjjZRBBh
         B/+KsdJLARWfnhd/wqovndpvyHAwAwkZxk40kGmpgJbxW38EHzrSHyUab/xppFvOcM4w
         i6LbWkWtU8SGQaH7SsVIsZbfhiiA69QTLM8ezCB0zq/kMZocfLjZhGnbo1NCPE/I3RwO
         WR2DC/VxtStBXsf0fxM4b1YqcDua7M9Pd8w6NETXt1NjPY0/FDP3y4aygSQGd8oVY3av
         9m9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PIUh8wR1+0AAFR8fB6HVLdYG12z8klZ1AKaxwRhBZSw=;
        fh=PtZpLNGIBTDgpCSVeCXEt9WlSdSipO0qz136Mu2UvzE=;
        b=PRXxR4zn9XpAozBhOmqFwDtCoaBDYDsrlfOmzyFUc0nr9Q74S7534vQrxdKsI7y9eX
         Mn5ydJyfct9I3/QTqY+Kewy+g8kThMtjv64+7MSPuX2QI0UXy1FIYsGLzilJdV2lj83F
         ll4KtYx2K4yJn7eW+H21m4Hhqu4sxO4idfVtwn9cJuxpxE4d95serkP0kCsnSavRMCIz
         Zl1a8Dd2OwsWfUVNqCYwM7AzXH3XkBq2/vex5VVjIYya8uZAs4g0hZJ4v+EUzuSUQ9LR
         JSjDzXXC5FUcy48SMS66Lt47wg5r6F5kTcyslJRzOloNO0AtezkJSqfiwdswurus8kzU
         9iew==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780552147; x=1781156947; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PIUh8wR1+0AAFR8fB6HVLdYG12z8klZ1AKaxwRhBZSw=;
        b=oxtb6/ZZovcD5kGQDvyHS8GBOkE4uABeOSaH0ZQu5QHBISIc5bvCKs60c9d1kBktWg
         9rFwwR08GCx/lkfRfd4zo5ACfvDc04aa+502GBGWTATkpCov2wyt3gKhMNHjIML1ct+J
         EAuY+PFe3560qV+PBeCv6N4AMscAzUHzYRGArJgBHXP7O37Rq/HBSKTwA3/NcuCRznXT
         8zkbRM/KrQz4XEL3q2H/RiEeKzEg6cRFXQ6UumBnmCIlyZts2Xtssx06dgHyJnJ5XFn6
         Gh6VmyF1eawJraGDVvv8J3U/pygliMew0n/U46tcqLdrP3W0LgCf8wKp/CBjvWR6AVwL
         L06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780552147; x=1781156947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PIUh8wR1+0AAFR8fB6HVLdYG12z8klZ1AKaxwRhBZSw=;
        b=m8Wh8pBCA2qfIx6JXLhN6oznY7LSgf/iSTbHTHm+FbvN0WZcosyHDXVPSJvlax47S+
         nniZt53ITVIBmhCc6SvQBnX5UhlIH4Lm7TPiwuXWrIiwbYKLe9+zaXgK8DcKH6dF4UjF
         IcQUQmPQbHmkcPDFSqf15avjYo0IWyPP8U8rhxIb/PREMDvRLoG/BsuQMOk+L45XFi+d
         /Vre3W0+54zAZ4lL8G+3MF6810emcuG1eON78ocLzvqIcAQBpj1mKpJzrxirfo9ZKmcb
         UW4O+ow1N+IVHhKc4WF2XoIAjAaH67ohltA4SyLX6LBzCbBSFw+5wo2+wsblvOfHqyfu
         SNog==
X-Gm-Message-State: AOJu0YxNmZ9dI+B0geF+EiFwVZst2meajGJOWAeBipv83Oggued9ac2k
	z6BBL9OdjtEfbjdvNFhIWMPQShRwFVGPUttAtRNeqtVFHLE3so3VecHjjVDX6/DOqod7yVQmnKv
	eonIsF+PukdaS8zEzdX/+KiLIL7ZjKGIFaqXtbuWK8Q==
X-Gm-Gg: Acq92OGTZac+kHg566znnVE53M1PsOg5qOPOHt3zho7gfEyMLFOdGTiVH86PLD6osje
	f82xk5zoRiLkSQCtKJuWLuzk1NXc298peYCcoVZjOx5hBY5Xg3CeJeuMBWbwNNklZA1+Q7k8cAP
	58yN8UAVhz1Y0qxscO1NKLjBTD/4OiQOBuByV/dP4IuLHxKPLPIVnYSqNGaeEgbFxwQfC22WMch
	x5f/aQlsHjLHUKVjgbAM1RsS0N2QA2gV47STqrAMTS1OPxkIM+Tp22qrcMhOfy1xHzJNq6pQdUT
	adK0SpDPk57aWIIdtKeV+2hjjbp3QjeSzOO/38VKqgxy3Vpaq/SCNqb2OhuhYU0coc8ir6m4RAT
	/DgVCGl/acfsF2zXrC0xg+3cOKKi8tAOtO6Pp
X-Received: by 2002:a05:622a:6113:b0:516:df5b:4338 with SMTP id
 d75a77b69052e-517786fe3aamr94112741cf.28.1780552146620; Wed, 03 Jun 2026
 22:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260526031517.1166025-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260526031517.1166025-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 4 Jun 2026 11:18:53 +0530
X-Gm-Features: AVHnY4LyQ7maifTN_o50bMgh-xrYsnwlJAwt9wlqVzVOlVBs2GIDYLsvccHKq1w
Message-ID: <CAAhSdy0RxUMYP-fs5=drG+6iwVEmwiVvHRL2MRieEXP7YiERjg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix NULL pointer dereference in AIA IMSIC functions
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Nutty Liu <liujingqi@lanxincomputing.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Jiakai Xu <jiakaiPeanut@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_224908_233590_DE4DF027 
X-CRM114-Status: GOOD (  20.94  )
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

T24gVHVlLCBNYXkgMjYsIDIwMjYgYXQgODo0NeKAr0FNIEppYWthaSBYdSA8eHVqaWFrYWkyMDI1
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IEZ1enplciByZXBvcnRlZCBhIE5VTEwgcG9pbnRlciBk
ZXJlZmVyZW5jZSBpbgo+IGt2bV9yaXNjdl92Y3B1X2FpYV9pbXNpY19wdXQoKSB3aGVuIGEgVkNQ
VSdzIGltc2ljX3N0YXRlIHdhcyBOVUxMIHdoaWxlCj4ga3ZtX3Jpc2N2X2FpYV9pbml0aWFsaXpl
ZCgpIHJldHVybmVkIHRydWUuCj4KPiBUaGUgZ2xvYmFsIGluaXRpYWxpemVkIGZsYWcgaXMgc2V0
IHBlci1WTSBpbiBhaWFfaW5pdCgpLCBidXQgaW1zaWNfc3RhdGUKPiBpcyBhbGxvY2F0ZWQgcGVy
LVZDUFUgaW4ga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX2luaXQoKS4gSWYgYSBWQ1BVIGlzCj4g
Y3JlYXRlZCBhZnRlciBhaWFfaW5pdCgpIGhhcyBhbHJlYWR5IHJ1biwgaXRzIGltc2ljX3N0YXRl
IHJlbWFpbnMgTlVMTAo+IHdoaWxlIHRoZSBnbG9iYWwgZmxhZyBpcyB0cnVlLiBXaGVuIHRoaXMg
VkNQVSBpcyBwcmVlbXB0ZWQsIGt2bV9zY2hlZF9vdXQoKQo+IGNhbGxzIGt2bV9hcmNoX3ZjcHVf
cHV0KCkgLT4ga3ZtX3Jpc2N2X3ZjcHVfYWlhX3B1dCgpIC0+Cj4ga3ZtX3Jpc2N2X3ZjcHVfYWlh
X2ltc2ljX3B1dCgpIHdoaWNoIGRlcmVmZXJlbmNlcyBOVUxMLgo+Cj4gQWRkIE5VTEwgcG9pbnRl
ciBndWFyZHMgdG8ga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX3B1dCgpLCBjb25zaXN0ZW50IHdp
dGgKPiB0aGUgTlVMTCBjaGVja3MgYWxyZWFkeSBwcmVzZW50IGluIGFsbCBvdGhlciBmdW5jdGlv
bnMgaW4gdGhlIHNhbWUgZmlsZS4KPgo+IEFsc28gYWRkIGEgTlVMTCBndWFyZCB0byBrdm1fcmlz
Y3ZfdmNwdV9haWFfaW1zaWNfcmVsZWFzZSgpIGFuZAo+IGt2bV9yaXNjdl92Y3B1X2FpYV9pbXNp
Y19oYXNfaW50ZXJydXB0KCkgZm9yIHRoZSBzYW1lIHJlYXNvbi4KPgo+IEZpeGVzOiA0Y2VjODlk
YjgwYmEgKCJSSVNDLVY6IEtWTTogTW92ZSBIR0VJW0V8UF0gQ1NSIGFjY2VzcyB0byBJTVNJQyB2
aXJ0dWFsaXphdGlvbiIpCj4gU2lnbmVkLW9mZi1ieTogSmlha2FpIFh1IDxqaWFrYWlQZWFudXRA
Z21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEppYWthaSBYdSA8eHVqaWFrYWkyMDI1QGlzY2Fz
LmFjLmNuPgo+IEFzc2lzdGVkLWJ5OiBZdWFuU2hlbmc6RGVlcFNlZWstVjMuMgoKTEdUTS4KClJl
dmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUXVldWVkIHRoaXMg
cGF0Y2ggZm9yIExpbnV4LTcuMgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2
bS9haWFfaW1zaWMuYyB8IDkgKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlv
bnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYyBiL2FyY2gv
cmlzY3Yva3ZtL2FpYV9pbXNpYy5jCj4gaW5kZXggODc4NmY1MmNmNjVhMi4uZDM4ZjVkZTA4MzRj
NSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYwo+ICsrKyBiL2FyY2gv
cmlzY3Yva3ZtL2FpYV9pbXNpYy5jCj4gQEAgLTY4Myw2ICs2ODMsOSBAQCBib29sIGt2bV9yaXNj
dl92Y3B1X2FpYV9pbXNpY19oYXNfaW50ZXJydXB0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAg
ICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gICAgICAgICBib29sIHJldCA9IGZhbHNlOwo+
Cj4gKyAgICAgICBpZiAoIWltc2ljKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4g
Kwo+ICAgICAgICAgLyoKPiAgICAgICAgICAqIFRoZSBJTVNJQyBTVy1maWxlIGRpcmVjdGx5IGlu
amVjdHMgaW50ZXJydXB0IHZpYSBodmlwIHNvCj4gICAgICAgICAgKiBvbmx5IGNoZWNrIGZvciBp
bnRlcnJ1cHQgd2hlbiBJTVNJQyBWUy1maWxlIGlzIGJlaW5nIHVzZWQuCj4gQEAgLTcyMiw2ICs3
MjUsOSBAQCB2b2lkIGt2bV9yaXNjdl92Y3B1X2FpYV9pbXNpY19wdXQoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1KQo+ICAgICAgICAgc3RydWN0IGltc2ljICppbXNpYyA9IHZjcHUtPmFyY2guYWlhX2Nv
bnRleHQuaW1zaWNfc3RhdGU7Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+Cj4gKyAg
ICAgICBpZiAoIWltc2ljKQo+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4gKwo+ICAgICAgICAg
aWYgKCFrdm1fdmNwdV9pc19ibG9ja2luZyh2Y3B1KSkKPiAgICAgICAgICAgICAgICAgcmV0dXJu
Owo+Cj4gQEAgLTczOCw2ICs3NDQsOSBAQCB2b2lkIGt2bV9yaXNjdl92Y3B1X2FpYV9pbXNpY19y
ZWxlYXNlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAgICAgICAgIGludCBvbGRfdnNmaWxlX2hn
ZWksIG9sZF92c2ZpbGVfY3B1Owo+ICAgICAgICAgc3RydWN0IGltc2ljICppbXNpYyA9IHZjcHUt
PmFyY2guYWlhX2NvbnRleHQuaW1zaWNfc3RhdGU7Cj4KPiArICAgICAgIGlmICghaW1zaWMpCj4g
KyAgICAgICAgICAgICAgIHJldHVybjsKPiArCj4gICAgICAgICAvKiBSZWFkIGFuZCBjbGVhciBJ
TVNJQyBWUy1maWxlIGRldGFpbHMgKi8KPiAgICAgICAgIHdyaXRlX2xvY2tfaXJxc2F2ZSgmaW1z
aWMtPnZzZmlsZV9sb2NrLCBmbGFncyk7Cj4gICAgICAgICBvbGRfdnNmaWxlX2hnZWkgPSBpbXNp
Yy0+dnNmaWxlX2hnZWk7Cj4gLS0KPiAyLjM0LjEKPgo+IEZvdW5kIGJ5IGZ1enppbmcuIEhlcmUg
aXMgdGhlIHJlcG9ydDoKPgo+IFVuYWJsZSB0byBoYW5kbGUga2VybmVsIHBhZ2luZyByZXF1ZXN0
IGF0IHZpcnR1YWwgYWRkcmVzcyBkZmZmZmZmZjAwMDAwMDA2Cj4gTW9kdWxlcyBsaW5rZWQgaW46
Cj4gQ1BVOiAxIFVJRDogMCBQSUQ6IDI2MjI1IENvbW06IHN5ei45LjExMzEgVGFpbnRlZDogRyAg
ICAgICAgVyAgICAgICAgICAgNy4xLjAtcmMxLWdiNjliY2IxM2VkNzAgIzIgUFJFRU1QVAo+IFRh
aW50ZWQ6IFtXXT1XQVJOCj4gSGFyZHdhcmUgbmFtZTogcmlzY3YtdmlydGlvLHFlbXUgKERUKQo+
IGVwYyA6IGthc2FuX2J5dGVfYWNjZXNzaWJsZSsweDEyLzB4MjAgbW0va2FzYW4vZ2VuZXJpYy5j
OjIxMAo+ICByYSA6IF9fa2FzYW5fY2hlY2tfYnl0ZSsweDE2LzB4NDYgbW0va2FzYW4vY29tbW9u
LmM6NTczCj4gZXBjIDogZmZmZmZmZmY4MGJlYjYyNiByYSA6IGZmZmZmZmZmODBiZTk2MjIgc3Ag
OiBmZjIwMDAwMDAxNjI3NmEwCj4gIGdwIDogZmZmZmZmZmY4YTM5NTMyMCB0cCA6IGZmNjAwMDAw
OGY2ZjUwNDAgdDAgOiBmZmZmZmZmZjg2YTdlODgwCj4gIHQxIDogZmZmZmZmZmY4YTRhNGEwMCB0
MiA6IDAwMDAwMDAwMDAwMDAwMDAgczAgOiBmZjIwMDAwMDAxNjI3NmIwCj4gIHMxIDogMDAwMDAw
MDAwMDAwMDAzMCBhMCA6IGRmZmZmZmZmMDAwMDAwMDYgYTEgOiBmZmZmZmZmZjg2NzIyM2U0Cj4g
IGEyIDogMDAwMDAwMDAwMDAwMDAwMCBhMyA6IDAwMDAwMDAwMDAwMDAwMDcgYTQgOiAwMDAwMDAw
MDAwMDAwMDAzCj4gIGE1IDogZGZmZmZmZmYwMDAwMDAwMCBhNiA6IGZmZmZmZmZmODAxMGU3MmMg
YTcgOiAwMDAwMDAwMDAwMDAwMDA0Cj4gIHMyIDogMDAwMDAwMDAwMDAwMDAzMCBzMyA6IGZmZmZm
ZmZmODY3MjIzZTQgczQgOiAwMDAwMDAwMDAwMDAwMDAwCj4gIHM1IDogMDAwMDAwMDAwMDAwMDAw
MCBzNiA6IDAwMDAwMDAwMDAwMDAwMDAgczcgOiBmZmZmZmZmZjgwMTBlNzJjCj4gIHM4IDogZmZm
ZmZmZmY4NjcyMjNlNCBzOSA6IGZmZmZmZmZmOGEzZGEwODAgczEwOiAwMDAwMDg1YzdiM2QwMDYw
Cj4gIHMxMTogZmY2MDAwMDA4ZjZmNTA0MCB0MyA6IGZmZmZmZmZmOGE0YTRhMDAgdDQgOiBmZmZm
ZmZmZjhhNGE1YTgwCj4gIHQ1IDogMWZmZmZmZmZmMjJlZDdkMSB0NiA6IGZmNjAwMDAwZmZhNGQ3
MTAgc3NwIDogMDAwMDAwMDAwMDAwMDAwMAo+IHN0YXR1czogMDAwMDAwMDIwMDAwMDEwMCBiYWRh
ZGRyOiBkZmZmZmZmZjAwMDAwMDA2IGNhdXNlOiAwMDAwMDAwMDAwMDAwMDBkCj4gWzxmZmZmZmZm
ZjgwYmViNjI2Pl0ga2FzYW5fbWVtX3RvX3NoYWRvdyBpbmNsdWRlL2xpbnV4L2thc2FuLmg6NjYg
W2lubGluZV0KPiBbPGZmZmZmZmZmODBiZWI2MjY+XSBrYXNhbl9ieXRlX2FjY2Vzc2libGUrMHgx
Mi8weDIwIG1tL2thc2FuL2dlbmVyaWMuYzoyMTAKPiBbPGZmZmZmZmZmODBiZTk2MjI+XSBfX2th
c2FuX2NoZWNrX2J5dGUrMHgxNi8weDQ2IG1tL2thc2FuL2NvbW1vbi5jOjU3Mwo+IFs8ZmZmZmZm
ZmY4MDJmZTdiYT5dIGthc2FuX2NoZWNrX2J5dGUgaW5jbHVkZS9saW51eC9rYXNhbi5oOjQwMiBb
aW5saW5lXQo+IFs8ZmZmZmZmZmY4MDJmZTdiYT5dIGxvY2tfYWNxdWlyZSBrZXJuZWwvbG9ja2lu
Zy9sb2NrZGVwLmM6NTg0MiBbaW5saW5lXQo+IFs8ZmZmZmZmZmY4MDJmZTdiYT5dIGxvY2tfYWNx
dWlyZSsweDE5OC8weDUwZSBrZXJuZWwvbG9ja2luZy9sb2NrZGVwLmM6NTgyNQo+IFs8ZmZmZmZm
ZmY4NjcyMjNlND5dIF9fcmF3X3JlYWRfbG9ja19pcnFzYXZlIGluY2x1ZGUvbGludXgvcndsb2Nr
X2FwaV9zbXAuaDoxNzQgW2lubGluZV0KPiBbPGZmZmZmZmZmODY3MjIzZTQ+XSBfcmF3X3JlYWRf
bG9ja19pcnFzYXZlKzB4NzYvMHg4MiBrZXJuZWwvbG9ja2luZy9zcGlubG9jay5jOjI0MAo+IFs8
ZmZmZmZmZmY4MDEwZTcyYz5dIGt2bV9yaXNjdl92Y3B1X2FpYV9pbXNpY19wdXQrMHg3Mi8weDE3
YyBhcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYzo3MjgKPiBbPGZmZmZmZmZmODAxMDFiZGE+XSBr
dm1fcmlzY3ZfdmNwdV9haWFfcHV0KzB4Mjg4LzB4MzI0IGFyY2gvcmlzY3Yva3ZtL2FpYS5jOjE1
NQo+IFs8ZmZmZmZmZmY4MDExZjIxMD5dIGt2bV9hcmNoX3ZjcHVfcHV0KzB4NDQvMHg2MTIgYXJj
aC9yaXNjdi9rdm0vdmNwdS5jOjYyMQo+IFs8ZmZmZmZmZmY4MDBkNTBhYT5dIGt2bV9zY2hlZF9v
dXQrMHhkYy8weDI5NiB2aXJ0L2t2bS9rdm1fbWFpbi5jOjY0MDUKPiBbPGZmZmZmZmZmODY3MDVm
YWE+XSBfX2ZpcmVfc2NoZWRfb3V0X3ByZWVtcHRfbm90aWZpZXJzIGtlcm5lbC9zY2hlZC9jb3Jl
LmM6NDkyMyBbaW5saW5lXQo+IFs8ZmZmZmZmZmY4NjcwNWZhYT5dIGZpcmVfc2NoZWRfb3V0X3By
ZWVtcHRfbm90aWZpZXJzIGtlcm5lbC9zY2hlZC9jb3JlLmM6NDkzMSBbaW5saW5lXQo+IFs8ZmZm
ZmZmZmY4NjcwNWZhYT5dIHByZXBhcmVfdGFza19zd2l0Y2gga2VybmVsL3NjaGVkL2NvcmUuYzo1
MTc2IFtpbmxpbmVdCj4gWzxmZmZmZmZmZjg2NzA1ZmFhPl0gY29udGV4dF9zd2l0Y2gga2VybmVs
L3NjaGVkL2NvcmUuYzo1MzMyIFtpbmxpbmVdCj4gWzxmZmZmZmZmZjg2NzA1ZmFhPl0gX19zY2hl
ZHVsZSsweDEwYzgvMHg1MTNjIGtlcm5lbC9zY2hlZC9jb3JlLmM6NzE4OAo+IFs8ZmZmZmZmZmY4
NjcwYTBlMj5dIF9fc2NoZWR1bGVfbG9vcCBrZXJuZWwvc2NoZWQvY29yZS5jOjcyNjcgW2lubGlu
ZV0KPiBbPGZmZmZmZmZmODY3MGEwZTI+XSBzY2hlZHVsZSsweGM0LzB4MzVlIGtlcm5lbC9zY2hl
ZC9jb3JlLmM6NzI4Mgo+IFs8ZmZmZmZmZmY4MDEyMWNjMj5dIGt2bV9yaXNjdl9jaGVja192Y3B1
X3JlcXVlc3RzIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYzo2NzAgW2lubGluZV0KPiBbPGZmZmZmZmZm
ODAxMjFjYzI+XSBrdm1fYXJjaF92Y3B1X2lvY3RsX3J1bisweDFkMTYvMHgzMjE0IGFyY2gvcmlz
Y3Yva3ZtL3ZjcHUuYzo4ODUKPiBbPGZmZmZmZmZmODAwZGE4ZWU+XSBrdm1fdmNwdV9pb2N0bCsw
eDUzMi8weDEzY2UgdmlydC9rdm0va3ZtX21haW4uYzo0NDY5Cj4gWzxmZmZmZmZmZjgwZDQ1Yzkw
Pl0gdmZzX2lvY3RsIGZzL2lvY3RsLmM6NTEgW2lubGluZV0KPiBbPGZmZmZmZmZmODBkNDVjOTA+
XSBfX2RvX3N5c19pb2N0bCBmcy9pb2N0bC5jOjU5NyBbaW5saW5lXQo+IFs8ZmZmZmZmZmY4MGQ0
NWM5MD5dIF9fc2Vfc3lzX2lvY3RsIGZzL2lvY3RsLmM6NTgzIFtpbmxpbmVdCj4gWzxmZmZmZmZm
ZjgwZDQ1YzkwPl0gX19yaXNjdl9zeXNfaW9jdGwrMHgxODAvMHgxZTQgZnMvaW9jdGwuYzo1ODMK
PiBbPGZmZmZmZmZmODAwNzhmYjI+XSBzeXNjYWxsX2hhbmRsZXIrMHg5NC8weDExOCBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3N5c2NhbGwuaDoxMTIKPiBbPGZmZmZmZmZmODY2ZmE5NGE+XSBkb190
cmFwX2VjYWxsX3UrMHg0M2UvMHg1ZGUgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYzozNDIKPiBb
PGZmZmZmZmZmODY3MjY3NTY+XSBoYW5kbGVfZXhjZXB0aW9uKzB4MTVlLzB4MTZhIGFyY2gvcmlz
Y3Yva2VybmVsL2VudHJ5LlM6MjMyCj4gQ29kZTogODA4MiAwN2I3IGUwMDAgMTE0MSAxN2ZkIGU0
MjIgODEwZCAwODAwIDE3ODIgOTUzZSAoNDUwMykgMDAwNQo+IC0tLVsgZW5kIHRyYWNlIDAwMDAw
MDAwMDAwMDAwMDAgXS0tLQo+IC0tLS0tLS0tLS0tLS0tLS0KPiBDb2RlIGRpc2Fzc2VtYmx5IChi
ZXN0IGd1ZXNzKToKPiAgICAwOiAgIDgwODIgICAgICAgICAgICAgICAgICAgIHJldAo+ICAgIDI6
ICAgZTAwMDA3YjcgICAgICAgICAgICAgICAgbHVpICAgICBhNSwweGUwMDAwCj4gICAgNjogICAx
MTQxICAgICAgICAgICAgICAgICAgICBhZGRpICAgIHNwLHNwLC0xNgo+ICAgIDg6ICAgMTdmZCAg
ICAgICAgICAgICAgICAgICAgYWRkaSAgICBhNSxhNSwtMSAjIDB4ZmZmZmZmZmZkZmZmZmZmZgo+
ICAgIGE6ICAgZTQyMiAgICAgICAgICAgICAgICAgICAgZnN3ICAgICBmczAsOChzcCkKPiAgICBj
OiAgIDgxMGQgICAgICAgICAgICAgICAgICAgIHNybGkgICAgYTAsYTAsMHgzCj4gICAgZTogICAw
ODAwICAgICAgICAgICAgICAgICAgICBhZGRpICAgIHMwLHNwLDE2Cj4gICAxMDogICAxNzgyICAg
ICAgICAgICAgICAgICAgICBzbGxpICAgIGE1LGE1LDB4MjAKPiAgIDEyOiAgIDk1M2UgICAgICAg
ICAgICAgICAgICAgIGFkZCAgICAgYTAsYTAsYTUKPiAqIDE0OiAgIDAwMDU0NTAzICAgICAgICAg
ICAgICAgIGxidSAgICAgYTAsMChhMCkgPC0tIHRyYXBwaW5nIGluc3RydWN0aW9uCj4KPiA8PDw8
PDw8PDw8PDw8PDwgdGFpbCByZXBvcnQgPj4+Pj4+Pj4+Pj4+Pj4+Cj4KCi0tIAprdm0tcmlzY3Yg
bWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
