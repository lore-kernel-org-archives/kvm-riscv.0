Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6942EC531D0
	for <kvm-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 06:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OIWs/Ws3mMU6RWn0jjL7VA9fIJ4Yvbr5h8NmzrFIRoU=; b=uwv8QrMMztEgdv
	NuSp01NvA9Oa8a4Bq2yOiT0FAPPXw+oV9oopx9rik1MLlePurMbzURbXe/kmBHoTor2dc/Ww5FNJN
	Y9yAyHJj1b2aBc/8QHtEXmG3ZoLM/KIS5Jgl8vskWNheHOJ9MJyDcgkoaSrr13rkluQAiC5g6p1xG
	qegJksbyfa/82pADi6716aigmUucM3GbCCLTrDm/14rHKi+uYC2pSjSpZ+jPY5k6WzFUB4y1Mnw6V
	zxZtIvmc03sAFk63qc7iULh1+PSarv8TEwJMnUO3yQYF6ibZfpcdSPF9tKOK5p3IHXM7Xpv6dFZF8
	ON/eUCnV/O8oBFja7Tkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKNg-00000009dCE-2ejl;
	Thu, 30 Jul 2026 06:36:36 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKNd-00000009dBU-3dtT
	for kvm-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 06:36:34 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-4758bd3731bso352330f8f.0
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 23:36:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785393392; cv=none;
        d=google.com; s=arc-20260327;
        b=lEeTJcnVobTHz+sthZcr4eacy7XXocodOljXZG6+gd6Oic3j4FrzY2GQm071djgQTL
         E8qLiHGk04xGCAZite85nDwxmLSBXO/WECMlsrQocXHR5OwOx7rHVarNR/L2MaiUDeZp
         JvlHOEqO822QPX/hSkXAAtGgh2Hw1qjYngQ3eoktooxfBh1nqM/BYb7LcxxG24pKmDP6
         3yZlpbcnHzVpiOnXmEvbUUWds75J4SwkVckubYczUne0tXMKoRhEs91JDJwtoFw7C8V0
         wfzMff2Qg5lfl3kqkA9yImeOclyMeigpEVj7DQKg1RiPIWtww7KrVomYpej9qqVVms3Y
         2GEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qTmettx8cBsuN1BktqpKr41TwEVmMBQwm8x7EG1kBB4=;
        fh=Px7Krs6H49P7gJ9zkPOf/UzpB0fmF97p4TUSKhSNBtE=;
        b=qRnEdpdFtkNONp9BK3MzvIhicbdQpqlxL3V4Si0wu21oTj3TlMeEE96wz0ec2eV5fd
         jDTSU2lhmgYfGcPItR8fTzXA/AVCAzvzanCVSw5YSfrOQWso0LCIvnwZJpOiTjQscDRD
         uQUebFZH0nrCv6VksU0E8CbWqQecch24dLNzAtqUOt53z847nrKqCP93etVZ4ZyfttDQ
         FkdzITWckPCy7NqEl8Ogzr0sjsH0O7tTpywvw1zf76WwXPrgPkU0pYYfCspwkeF5329l
         ByxIxO9QLDxUJiH0g4PfNR95S5Vp2hnoIjA0D9HYfHp3GBwH85xOxiyv45XHINPhsppz
         xw7Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785393392; x=1785998192; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qTmettx8cBsuN1BktqpKr41TwEVmMBQwm8x7EG1kBB4=;
        b=kjTVwpAs1A55XyI2RFNuA9BlRsA645tl5GttoJwRIq8hBU+ZpRMKch+yehcV+psDq1
         lsfjJlnr60O6scW/eb4SCkKIGtqfplk2g3KWXiEWBpo6ZZbpmg9epITaRazWVY026qvh
         lS0gpqGU411OioAuUnAik8k4RqbnpYebM38l2pMpC8gViJGltbA62ZHIY01oh0Oq+uwJ
         s8dJogz40/G830lim1Jfy8/PpvfIHF7b2vq0OYOwYNbTvJogKkw//E27U8cGAB2xbzsE
         VuitOMESyKohxXzEuZGG6igZ2HsIj3xgPcWn1LEfYcUKJAg7QfMjfLMr+oCUef+i5Ark
         YMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785393392; x=1785998192;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qTmettx8cBsuN1BktqpKr41TwEVmMBQwm8x7EG1kBB4=;
        b=g84gM0KCqc9oyM2M1nQb2Xq1isvhiOBIvVxo8FhflVtTuu76R760qxhIE0/wwKVuLD
         4WYKxQ57Vw3bPhzL3esKFjPG206DR4vfxH7MsVGlNgyb4/guVwPuR/niKZh2mYk/gDLv
         Oe1OAZlRxKRdRAyTk4GmHcB0sNzflJVwcBe41ZXYZEQ1dhC2VPEeFOCh5v9rOM2CNDwY
         hfCI64TNJ0MqDo0uA2c+YUmW4On8hRVKWyb1B21Uj3SPRkzjnKBNZ2L3AaygD7KKUP7K
         5Mmojm5bDkOj007KSdEeQOH4KgOiiDXgyOiEInTIXc5lReqPXvJaMu2HOKblQuhoYy42
         fbPQ==
X-Forwarded-Encrypted: i=1; AHgh+RpNk6a9Ahe1PXWxlmkXSld43BDT1WTAqrMtSH3Numfx4HNP3Ik9r88aR+5SY0Yr2kU1Rd6rF+qwsO8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwraBKP4Nok59B6nNnt1pzazW4uScOek57125CD5kjKAAhadiPE
	hfUbUcf7OhHp6RT/L1KvtiFFuT+9jfPrs75PO9nsyT8JEm9MIIL6dfKEvcV28TDAQk5ad8jedQn
	aeVo1oxOX3WGO2RT9upE7HIryTV7UHRV9ITc3uDGchQ==
X-Gm-Gg: AR+sD13AyP0M+Ay8ilchXjRtq4h3+lxsIgz59XzqZZxksp1JPYpXKognhAJOxiiFAj/
	KV8g75ZhaSIxPJWvHmKv7mkVfHCk9KHWPTmj8xz+aV9LmWRtA7OgOkl96NxGMatrVLElfjJvlzC
	V4r4U8oNTspG1acg3x9ynkr3GBzS6AV8xI/vODsDxOn5ZAxuVbFy5t4ZdWUiW1yO6KOPeibngJP
	QS42xh2rF75gT2HxNbbe4gmyyEmHEUtV4lR+d1N+SoR9y9JX78LI8hD9uhl955vhGwjCLlT9RAb
	TBgzWyV5Onb+FiW7CAQqOYMO1syMNsfcqCivjARVRHrijn2taG4HY5sBtuP2XOF3mQ40ETma/HL
	xmpUKm2q3k3MCORLMA8sb1TQUjqWCy+wKg+XMcVDdi9q7KflUOQ6N5qErKT4PXtg=
X-Received: by 2002:a5d:588f:0:b0:475:da0e:744d with SMTP id
 ffacd0b85a97d-47fc8bd9a17mr1123969f8f.8.1785393391373; Wed, 29 Jul 2026
 23:36:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260729232527.139183-1-inochiama@gmail.com> <20260729232527.139183-5-inochiama@gmail.com>
In-Reply-To: <20260729232527.139183-5-inochiama@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 30 Jul 2026 12:06:18 +0530
X-Gm-Features: AUfX_myMCEfrPFgw6hpa1bzA5HZDULLUkMJkPLOpIjbzM3NJsjXgJbt-fDAUHQY
Message-ID: <CAAhSdy3mzKDCy1zEpB7K7qJHG_mUThUu_bXwD+n+RjONPvtS3w@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] RISC-V: KVM: Mark the reset callback of FWFT
 extension always dirties CSR
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_233633_925547_C7AEFF32 
X-CRM114-Status: GOOD (  14.25  )
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
YUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQXMgdGhlIENTUiBpcyBvbmx5IGZsdXNoZWQgd2hlbiB0
aGUgY3NyX2RpcnR5IGlzIHNldCwgYWx3YXlzIHNldCB0aGUKPiBjc3JfZGlydHkgZmllbGQgaW4g
a3ZtX3NiaV9leHRfZndmdF9yZXNldCgpIHNvIHRoZSBDU1IgY2hhbmdlIGNhbiB0YWtlCj4gZWZm
ZWN0IGltbWVkaWF0ZWx5LiBUaGlzIHVuY29uZGl0aW9uYWwgc2V0IHNob3VsZCBiZSBzYWZlIGFz
IGFsbAo+IHN1cHBvcnRlZCBGV0ZUIGZlYXR1cmVzIGNoYW5nZSB0aGUgQ1NSIHN0YXRlIGN1cnJl
bnRseS4KPgo+IFNpZ25lZC1vZmYtYnk6IElub2NoaSBBbWFvdG8gPGlub2NoaWFtYUBnbWFpbC5j
b20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+
CgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYyB8
IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2Jp
X2Z3ZnQuYwo+IGluZGV4IDU2ZmI1OWFmZTAyYS4uMmUzNWU3ZTEyMzI3IDEwMDY0NAo+IC0tLSBh
L2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3Zj
cHVfc2JpX2Z3ZnQuYwo+IEBAIC02MDEsNiArNjAxLDggQEAgc3RhdGljIHZvaWQga3ZtX3NiaV9l
eHRfZndmdF9yZXNldChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gICAgICAgICAgICAgICAgIGlm
IChmZWF0dXJlLT5yZXNldCkKPiAgICAgICAgICAgICAgICAgICAgICAgICBmZWF0dXJlLT5yZXNl
dCh2Y3B1KTsKPiAgICAgICAgIH0KPiArCj4gKyAgICAgICB2Y3B1LT5hcmNoLmNzcl9kaXJ0eSA9
IHRydWU7Cj4gIH0KPgo+ICBzdGF0aWMgdm9pZCBrdm1fc2JpX2V4dF9md2Z0X3ZhbGlkYXRlKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAtLQo+IDIuNTUuMAo+CgotLSAKa3ZtLXJpc2N2IG1haWxp
bmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
