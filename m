Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C27C54FDF
	for <kvm-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 06:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=glzVHJga1/sD1HafTFd0xOVvJVmjYUjfTtUkjgtuRbU=; b=ZW4i3V/XXySFVG
	FUrjKRLe7XtUc2pDMJVdTFoMhVVApeickIGH1D6V2qaRPC8rzU4MG7rtTW2zXmR0cU1+3uCmDY5QZ
	gQXMU/gx/o8J9PwKECktvdv1W7wcRnTxeglsbGGfPuTZjjPSXOhpGpt1Ze+j4EeCZqx3VWk7JTRfk
	tCOhSdA5vpMg+xb4x4ixYTNIdmAW7uHdWlz3ewtr3N7eMCexre+3JgmJdRwG89wLL173duZiThVqF
	biJrHkoPgEVdAz4i+sytFoK9AcabX6baSIiEtlHwu2s4rLc3Ren8rnK5v7ZATwkZp7e2bK3NdWg2K
	emwW6LSzeUBxmU4JIRew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKMB-00000009d05-1YHO;
	Thu, 30 Jul 2026 06:35:03 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKM8-00000009cyi-3Oc1
	for kvm-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 06:35:02 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-47f633e6058so1567398f8f.0
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 23:35:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785393299; cv=none;
        d=google.com; s=arc-20260327;
        b=YjCJZw2jEsBIv2zsdkvLHRJydTSOzwg7mKrpXBdjap6vMtCyGKAWWs/I0RjjDlzQpH
         QZCD9AiHFt2aKkipHHoW/5IpcgBBz8vj15Cu3APHOhUyQUokNP1pjtRku/PC0vMQ8N14
         2o75Q1Bvl4rsy5LQLYKiSTdJCW3FlbVIppVGAIQYZR2KVX4I2UmrHt7lUffT/Jc8Z1SH
         2omnG5q+Sk4Twr6MDoMRcPmObWVLtg4g0kFrZRpL1Kxf+X2TeOTwiIsdLjt0iLCNwqTh
         TqY0HL7KUpyLiyoM0Ox4p+GpTlDPRgO4/y38/HF0V5jVTCQINPMXExU9j2BsA2PVwZBG
         058A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IbxqtpZnShFKaHKefEe4sTCSmkBdNGqkiQHmyC+L+Hs=;
        fh=Au+ZVV5osji6cWlZF9RA6I+wa42arTTw2UW0BezLdGM=;
        b=EAN30czGnaapNDwxOlQ1zE74QvWzul3OwyrHxdwDToG/MKZnLWwas9qZvyYiVv/Jp+
         yhcXuoPOq7DlcReyyjNQkwfsOldoiUY46npNTUEqTZCId1Y9KCjLrphbyAUgkbTZ33R+
         G8HOcfFWmlmqHv+qRCmzPwzqa8Nf/4JXyHwvOzJvUEv3ExmN9aioS+jf1epyTNn16b0e
         DV5b0QvhPx1IHa031LbnKAnktozjEYvV+YGxgdBwT2XI6D0HwUBl7+bQep7pIUJS2qi5
         eccEv/Jokwqi219G7AWyHhIP4rrffMuYNEtNIy+39kZCCX5OFef90z4ROhKL9tLFBwJ/
         h3aQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785393299; x=1785998099; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IbxqtpZnShFKaHKefEe4sTCSmkBdNGqkiQHmyC+L+Hs=;
        b=xop1upB7/Itso/NNL7MV7X9BvkeP2vdSGUZ6GH+1OLIo7v+pQiZ1BbkxYb2LVUx/Vi
         gzyUYfREuGI6Dy4SlUl5AiMphycX5OWLLiDmUEuM+lI7BfiTGyYM0/q6m7X/Lo8OfTXP
         riSW/SWViXWiDOknQwrn4K6ItH6rQ6F0IJMbgiCqqHkAQldT2ARZ/X24jjTn35VgJWSY
         n8bIOhgsLwe3WKHSXjiJQ0FFsWQhpHyWm+/io8wUITzRRGi9X2xr9sE5438tr4hj9QZC
         mY6DOADdTqNwm1V3YEfZrwGc8GnLM9UcM8V4Fah8f1X3Io5DACmE2YgiU7agOESV66tm
         NVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785393299; x=1785998099;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbxqtpZnShFKaHKefEe4sTCSmkBdNGqkiQHmyC+L+Hs=;
        b=hTrH2myBlMls24REBZr85bAVLX5NM6EYaHr+uoG7YFKENTxMqoWA9FlBJ6/dCIUcWS
         9GYRfNa7KtIJc2W0puPuFmRnQTkBkm4xZPqfKcZQbg0iwGsSqZ0mVu/+BnwhrAiUSOer
         NpkwmGLJos2KoM8aWPwJfuR9ra4kwJ5uz2cA0agt0LwT90bfWi+pCA1LS0DLz4VWAsYq
         3y5ns6yDttFZIv6FEDPNPiA/kg7+mbCq1F6oZuVpQeO5gKksKwavEgZ3QK9lRC/ZEeeN
         owCWbb+mnPCPRuTcafUmNVMAfwXFb/ZsXXSit42t+kVJRzCQEEJRXuK9+rDBwDZ11Lny
         YCCQ==
X-Forwarded-Encrypted: i=1; AHgh+RoVUI8CHBf2fvsEINJyWPM56aVZQ22iJ2y2wWBKzu1Fot5oi7zZTwmwn6fyyVBkmRnwOBNHrK+BIcs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxcAsSFHivmd13NEoua4pJmJYEz6TzTqEKCb84pWYQrwpuYV+uD
	j9pj2a89EI1taYlV/NnuWogn6vyTC396ovHXJMiWJgkMHPNShyb2ETzAzshL/XGeBNULQPqvoda
	PzHdUiL2TDaUC3kumZ03g/XDiqMlWvhluwg+GsLEilj5uh48irJ6YPYg=
X-Gm-Gg: AR+sD123mCN12Zb98r0CcC9oDMU2Ip+C/GdnHcrIkk+dEkwoeEi5bqKu6HeGS3yrUzT
	jJ3X6B0IVFhMf8OFT2XfrQXyWVljOdEwgnZUu7hMIUUWh5Yl/7ia+iniGQ9M1RQnmPNVNb4zwWf
	Umpg19mMvFhHi9EVlwhecpJ5FV4aGMZSLIo0lkr3tGJXQzFTKQSJ2422dXU+cym8QVDWVQQqxIV
	scorod2OUOY8SwAiN3Dfrq75iXfq9bDaE9ORCECVj/Xaq/SxIPK/hZDoxZxc3m1y69x7pVmPeYb
	u49J+aZhHP2s8g5cdVWFnAr+RCvgFBD96GoOy6L0qoVjF96iHPMEVwhI0zE4wzxGTEahpYK1RUs
	LU789p6WI+iBT+pYCl+WgsUxTocn830j0HElypXFJt7BaLmumhREOLP/mxcwXEFEcDu2CZqDDGg
	==
X-Received: by 2002:a05:6000:2010:b0:47f:4fa9:ae42 with SMTP id
 ffacd0b85a97d-47fc80c2fcbmr1669738f8f.11.1785393298545; Wed, 29 Jul 2026
 23:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260729232527.139183-1-inochiama@gmail.com> <20260729232527.139183-4-inochiama@gmail.com>
In-Reply-To: <20260729232527.139183-4-inochiama@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 30 Jul 2026 12:04:45 +0530
X-Gm-Features: AUfX_mwiU5ddNzdK7WpCSdf3HhHn67Wv5Yj3GZUH0R97aWLgDl1m06xy4O4sbCY
Message-ID: <CAAhSdy2dMcuYv=vvVDabxv92OwM6HMU5LuH84Qqu86YZfEDV5Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] RISC-V: KVM: Reset the SBI extension when disable it
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_233501_126415_AD8C3BE1 
X-CRM114-Status: GOOD (  17.57  )
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

T24gVGh1LCBKdWwgMzAsIDIwMjYgYXQgNDo1NeKAr0FNIElub2NoaSBBbWFvdG8gPGlub2NoaWFt
YUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVGhlIFNCSSBleHRlbnNpb24gdmFsaWRhdGlvbiBjYWxs
YmFjayBjYW4gb25seSBmaXggdGhlIHBhcmFtZXRlciBpZgo+IHRoZSBleHRlbnNpb24gaXMgZW5h
YmxlZC4gSG93ZXZlciwgaWYgdGhlIGV4dGVuc2lvbiBpcyBkaXNhYmxlZCBhZnRlcgo+IG1vZGlm
dHkgc29tZSBwYXJhbWV0ZXJzLCB0aGUgc3RhdGUgb2YgdGhlIGV4dGVuc2lvbiBpcyBzdGlsbCBi
cm9rZW4uCj4KPiBSZXNldCB0aGUgZXh0ZW5zaW9uIHdoZW4gdGhlIGV4dGVuc2lvbiBpcyBkaXNh
YmxlZCBzbyBpdCBjYW4gaGF2ZQo+IGEgY2xlYXIgY29udGV4dC4KPgo+IFNpZ25lZC1vZmYtYnk6
IElub2NoaSBBbWFvdG8gPGlub2NoaWFtYUBnbWFpbC5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6
IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpUaGFua3MsCkFudXAKCj4gLS0tCj4g
IGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMgfCA3ICsrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2Jp
LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jCj4gaW5kZXggYjczN2U5YTdhMTJhLi4xYzRm
ODc0MzY4ZmIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYwo+ICsrKyBi
L2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKPiBAQCAtMjIxLDYgKzIyMSw3IEBAIHN0YXRpYyBp
bnQgcmlzY3ZfdmNwdV9zZXRfc2JpX2V4dF9zaW5nbGUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+
ICB7Cj4gICAgICAgICBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2NvbnRleHQgKnNjb250ZXh0ID0gJnZj
cHUtPmFyY2guc2JpX2NvbnRleHQ7Cj4gICAgICAgICBjb25zdCBzdHJ1Y3Qga3ZtX3Jpc2N2X3Ni
aV9leHRlbnNpb25fZW50cnkgKnNleHQ7Cj4gKyAgICAgICBjb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVf
c2JpX2V4dGVuc2lvbiAqZXh0Owo+Cj4gICAgICAgICBpZiAocmVnX3ZhbCAhPSAxICYmIHJlZ192
YWwgIT0gMCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gQEAgLTIyOSw2ICsy
MzAsMTIgQEAgc3RhdGljIGludCByaXNjdl92Y3B1X3NldF9zYmlfZXh0X3NpbmdsZShzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUsCj4gICAgICAgICBpZiAoIXNleHQgfHwgc2NvbnRleHQtPmV4dF9zdGF0
dXNbc2V4dC0+ZXh0X2lkeF0gPT0gS1ZNX1JJU0NWX1NCSV9FWFRfU1RBVFVTX1VOQVZBSUxBQkxF
KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT0VOVDsKPgo+ICsgICAgICAgZXh0ID0gc2V4
dC0+ZXh0X3B0cjsKPiArCj4gKyAgICAgICBpZiAoIXJlZ192YWwgJiYgc2NvbnRleHQtPmV4dF9z
dGF0dXNbc2V4dC0+ZXh0X2lkeF0gPT0gS1ZNX1JJU0NWX1NCSV9FWFRfU1RBVFVTX0VOQUJMRUQg
JiYKPiArICAgICAgICAgICBleHQtPnJlc2V0KQo+ICsgICAgICAgICAgICAgICBleHQtPnJlc2V0
KHZjcHUpOwo+ICsKPiAgICAgICAgIHNjb250ZXh0LT5leHRfc3RhdHVzW3NleHQtPmV4dF9pZHhd
ID0gKHJlZ192YWwpID8KPiAgICAgICAgICAgICAgICAgICAgICAgICBLVk1fUklTQ1ZfU0JJX0VY
VF9TVEFUVVNfRU5BQkxFRCA6Cj4gICAgICAgICAgICAgICAgICAgICAgICAgS1ZNX1JJU0NWX1NC
SV9FWFRfU1RBVFVTX0RJU0FCTEVEOwo+IC0tCj4gMi41NS4wCj4KCi0tIAprdm0tcmlzY3YgbWFp
bGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
