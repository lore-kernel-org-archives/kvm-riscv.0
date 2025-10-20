Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC33CCD193
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 19:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:Subject:From:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XWZ0alRC0Aq178PcDidjeq/ne9ogftqqHrmF7hBT1ak=; b=jINQCazKzlgjxN
	Vm4Vc4kCg+eYgkL9LVo5N4KG5rnoxkcMKm3xkd3tUEK0momKjs+q4LJ23qxPHglBAgUXEoWLg6+X8
	hbmR6/jHU5wiRbDG++ox/+fZijif73Z546m/dmMOKGp1WzjIJLPJ83sehm7/9T1L8Kybg0z5UTuEx
	fwwQYO0gRymckvK+wnMxLijP9J0KNR8Mh2uskEPn8sSbUarESmdkWBuQ9QNIijSVxdsCrFLDXHK4l
	R+qi7mHggSuMTjPpG7fmzueMLub+1bqPsSSyXzUz1KKoJRN5xbpdqiuDFBLTOgZcBvAIAa38IxbK9
	I7QVJDsRl5Od/swkLTIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAveK-0000000EnJJ-45Hb;
	Mon, 20 Oct 2025 19:34:32 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAveI-0000000EnIT-1ePS
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 19:34:31 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3f4319b8c03so502215f8f.0
        for <kvm-riscv@lists.infradead.org>; Mon, 20 Oct 2025 12:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760988868; x=1761593668; darn=lists.infradead.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhbTV0JDAvT78Ni6sXh/SvcLdbNCRHBdaXLuvFgWdvc=;
        b=hhHV7aBfIj4FbB9p7jmuKMIG+rcikXCWNNvoHwO6/lAzilYh52jFRCg/2t+PrxvtDu
         TuQCTqnl69bHr5+xVJtGN9fVCMgxq4AgHXU31ZYcsm6TWJkXVDBkk1KhUZbhmd5FZGD8
         q5OV2WRY0VujRiDlC41RqL8A+svwvxdq5ERZeyyyMLGVog240usOSj/LXq1QMx1xB7BL
         X3GfPCFpg60gaYNaWklrzyi+LUb0XWX2qKpjCDlX5tyByfJn5auN+1jWaKgDTg+J14Np
         7dhE1gBqWBobAsHAjgk45BBunbgd64YHYHCxQd84tOed2YVR1AxgH+dR3Jn6vaM5iKRP
         fkug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760988868; x=1761593668;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QhbTV0JDAvT78Ni6sXh/SvcLdbNCRHBdaXLuvFgWdvc=;
        b=pckSljAz9K1XNDsFcGz51KxWbtMz8bJD1Lmte17Ur+MxVhBXq6d9XN69uZN+Jx2GS+
         YbO3BZnyyxSZK45MJ9rwGubNlVFjgxNgRGjX85TCOSw+TNyYNWub4Xv8eJNFb0Wgba6I
         /ByjyXR85mSKf+s5vs4xOpryCtK/RZl5I0+ZXrwJgKlrwnPCA5kvfqqJ9gAd+SmhnKai
         4SdUGOQ6JyFVGh65BWWgZL7F5mWl5LK3IqUaYsZ3XTcKgs6KV6E1MuFRCauEDypO3jKg
         bxoeQmvXHPTErWckboNfLoy5Ml6tj9vbcqksf6OJR8KwYeU3XON97mi5XAzH3zyXHHF5
         SfRA==
X-Gm-Message-State: AOJu0YzDkv/BgKv+VCDdMeuCFZf/8NGzIyfTRmOSgrkWnYsqvBj6R/Lh
	giWDQrcWGzQF5+l3AB/Z5llfUBPfJ4eXNa87YVKRowOF0++mnzgpe4Ws/U/CX/mX3kQ=
X-Gm-Gg: ASbGncvzU+843pffHvh74hkG45GwmXhkcLATFxTTt7IunYVjmBnIPQVTYJIUlxIowot
	0K9XpNnprZbFhmaDVta2Gc1bOSjHRwMHNwqY7g238wh89XG0fYzdFGs6fovHI7f/BCnjsdZBjOY
	JL/3Dc0+vGAkP0TlKWX/TGY3RXbb1GQ99BcbPXe8fhM2H7n3l/admf1+Ky0ZC+OUmvOnewupXLn
	ldF9bpJUlvK+ZGyG5E3+pO5wjTzZyhz8f6c/N7QVyTIwmygUW/GNLEQYDNfLWfbBgnJaa038iqj
	51j4fiySTmj7E+DLeXSnSwR5sygYxiZLBPSdx/EW8dCYNJ7solh9ZG4yBWLOKYjxTZRY7z/I+3/
	fRYOJRK54NHJfZA7D+xh4RU/Y3vAAXuYdocnUnjIFVAYdeSGjffU4ZTvAu+y6BhvU
X-Google-Smtp-Source: AGHT+IEub7VXT88PEBj8mPwze9/2g9rMQV0B8cySnX2o4gVxAHkvPWqN5bWsXtqUJAOihjcio5iQDA==
X-Received: by 2002:a05:600c:474c:b0:471:1387:375e with SMTP id 5b1f17b1804b1-4749436b96emr3609035e9.5.1760988866644;
        Mon, 20 Oct 2025 12:34:26 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::bfbb])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f00ce08asm16603949f8f.44.2025.10.20.12.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 12:34:26 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 20 Oct 2025 21:32:57 +0200
Message-Id: <DDNEF8ASSO19.2P4OJ3KYPWRIH@ventanamicro.com>
To: "Wu Fei" <atwufei@163.com>, "Andrew Jones" <ajones@ventanamicro.com>,
 <wu.fei9@sanechips.com.cn>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH 2/2] KVM: riscv: selftests: Detect supported vm modes
Cc: <kvm-riscv@lists.infradead.org>, "kvm-riscv"
 <kvm-riscv-bounces@lists.infradead.org>
References: <20251017110908650RWBl7sDIk6WUGhkvJSH4L@zte.com.cn>
 <202510170319.59H3JmWd056039@mse-fl2.zte.com.cn>
 <20251017-f2c1b717d2364067c64f95a6@orel>
 <93d3af21-5d3d-465c-a9f2-0eaed7475fb3@163.com>
In-Reply-To: <93d3af21-5d3d-465c-a9f2-0eaed7475fb3@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_123430_651790_3383CB3A 
X-CRM114-Status: GOOD (  12.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

2025-10-20T21:26:18+08:00, Wu Fei <atwufei@163.com>:
> On 10/18/25 00:04, Andrew Jones wrote:
>>> -               guest_mode_append(VM_MODE_P56V57_4K, sz >= 59);
>>> -               guest_mode_append(VM_MODE_P50V48_4K, sz >= 50);
>>> -               guest_mode_append(VM_MODE_P41V39_4K, sz >= 41);
>>> +               guest_mode_append(VM_MODE_P56V57_4K, satp_mode >= SATP_MODE_57 && sz >= 59);
>>> +               guest_mode_append(VM_MODE_P50V48_4K, satp_mode >= SATP_MODE_48 && sz >= 50);
>>> +               guest_mode_append(VM_MODE_P41V39_4K, satp_mode >= SATP_MODE_39 && sz >= 41);
>> 
>> Something along these lines was what I was suggesting in the last patch,
>> but where we select from many more combinations of P and V for modes.
>>
>> VM_MODE_P41V39_4K
>> VM_MODE_P41V48_4K
>> VM_MODE_P41V57_4K
>> VM_MODE_P50V48_4K
>> VM_MODE_P50V57_4K
>> VM_MODE_P59V57_4K
>
> Do we need more? e.g. for sv39, there could be P50V39 and P56V39.

Bare is probably the most important first stage mode, as it's the only
one that might fully test the two extra bits of Sv57x4.

I think a single combination per "x4" mode might be sufficient, since
all non-bare first stages generate 56-bit physical addresses anyway, but
it makes sense to have all of them if we're doing more than one.

>> 
>>> +
>>> +               // set the first (maximum) supported mode as default
>> 
>> Please, no C++ comments, and don't we want a V39 mode to be the default?
>> In fact, VM_MODE_P41V39_4K should always be supported, so we can just set
>> VM_MODE_DEFAULT to that.
>
> It's likely the maximum supported mode is the most common configuration 
> on production?

Yes, KVM currently picks the widest mode, although I think the optimal
choice of hgatp is the smallest one that fully covers the whole guest
physical address space.

(e.g. if all guest memory is mapped below 2 TiB, KVM should pick Sv39x4
 for its hgatp, regardless of what is the widest supported mode.)

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
