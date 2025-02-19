Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED373C021AA
	for <kvm-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 09:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:Subject:From:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SMVy/KNM1BDN+k2LlmrxBsoMmxuBytfr6Y3md1Kq7GQ=; b=x4fw83gfUixlS6
	kKoN+PlzDFf9jE7VN6v4Ra/zoeOKsEX+Exm2ePlM26iSvnfTix750EkyIe0XLYxE8ilP/Sn/+FKdL
	zCWfUOR0VENCzE7kldBpwxUcPofcp0iLVMOPCB21Dbrh1b+PU3w3t6IaKGRgBx39vf5aFbU/QHtj0
	9htvVwW9gbWq71d1tFd5CvPfJlL7tpTlNn1auATJlNZWkK0ZahHHWQcsCjrlq42hfbAwLDstXb+uX
	/eW1SsahLxKyf3fbI6AKSuAGsd0FI1Q462wHBjMo3KS5SlB9N9CsJekTHY29qLxFkdMVaaosIbLrq
	uC7VqO6/Y+Ypkkx1OOOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgBv-0000000BmXI-31O6;
	Wed, 19 Feb 2025 09:16:27 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkfnR-0000000BeE9-0ZMC
	for kvm-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 08:51:10 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43937d315abso8571005e9.2
        for <kvm-riscv@lists.infradead.org>; Wed, 19 Feb 2025 00:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739955067; x=1740559867; darn=lists.infradead.org;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyOr3ZD32WYQ578+kdBxZIoR9hORXh2QvsH9UB3Wz3E=;
        b=UUl87dOwT7CPU20Kl5nZKqBoQrPnxPQfQBQcPOszUse+xrgQ+fdx6tBIOkDMjvx36l
         OKlVVm/V4c2vkMkbsVJNFHMuQfXx1J3f+k/6VSCGcVOQE3wOpzkDkHtbduXQNybx6Kxb
         W4wViD2NMUi6eM27GWcVBrHi9QwefY17VWdKPZ5i3ZItpJb/LWSldCWvlQ1elGG1ndm1
         LzIvD5VfWJeefZhsfxykwBRN6jzcan2GLSP01H+IdZjyaffvcBc6RPUjfp62SsTcObNa
         2k7IE/XSTf/6By4wR/384BVMr4SWahW+roKLIX1cPVm7Jtsz0s9W7CB2a9iq0xe/SAKc
         dstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739955067; x=1740559867;
        h=in-reply-to:references:cc:subject:from:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cyOr3ZD32WYQ578+kdBxZIoR9hORXh2QvsH9UB3Wz3E=;
        b=Owh5dndM//n+7RIE/qPkPTIGKUMuUClX1jClMs7FLUGWfIy9R/4yMMBXgcV3hJnG9h
         g4EmBWVNJSX5zh5z8iri+3ioDhdv1iREAYzzZtXObll79fPPGPyLTyOJiLOub1l+sGkW
         algMrfAchH3FT3afgcx+M6aZq2NN+8+ZgD0RhrB3/ULnxeJxg1sCFiTeTGkcXBdhKQWP
         pvj4UKJcs/nAc/XpeNdlkv4FK6a1310hPnISt0M1yvyLD6JpattUZ0ZzDrSNqIQirdOt
         fJ25pUK6vP6sD4M45NWmIUWybf+FtM3iNrXRHV8EYd98CNy2WvCgn69grtkaV6oYi4SF
         U82w==
X-Forwarded-Encrypted: i=1; AJvYcCUUvWMmBEKVdlvHNhMpr9RUeuG5TYMV+Ohx8VmaQEIc+P01DOtR4BRLMHOFiGfdYuldbp4DcTQ/SI0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyO0E23FKYpu5uIB5SIvTHuw1BFEv+5b78AQLI5fiW10gM5WWei
	UH5Mmr0DsNGoM2pLQBiwr4citfyzoA1x8i7ZrDsxWNYKE+h8yscJIScwpY5AtN8=
X-Gm-Gg: ASbGncvvqpkl7mTfKY5mJ0U/PsEErOravB23sLFwRlit4upcCFOl1bxDEwZpI86rDCj
	YVHwnOySfl4Uo0JYmpoQkhsqn6JB5a9+qZJyOwuVWkW9nDwDhlutceFF/Jsz8MLnG6Z0XA6+C5n
	666NpIE2BPQ5qiJmyR1ve0oD/H5xGtNNCYgr8QSvauszRjAP7R8/pq/ixtBbnIvP3M0No3EzQ30
	iqAsb4pIWUcBFzWkDweXiBaOua1PozsId6ZEuM1WORIhZPT/B3IOkrUQaUNZOclprCr0z/PVF/q
	n/9AABrDJeBT5vaDn81ZM/tY1W6i+cl0HtYCuJK0YHkq/xsGB2o=
X-Google-Smtp-Source: AGHT+IH6D4plZNYfuEYjbGdATaVAlFztkIrp/rClPpYzS5dL67Gt7zhXEE8RN1q+8mV+NLcuY45v6A==
X-Received: by 2002:a05:600c:524a:b0:439:4d1c:bf72 with SMTP id 5b1f17b1804b1-4396e77b89dmr62388815e9.6.1739955066877;
        Wed, 19 Feb 2025 00:51:06 -0800 (PST)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8730sm17632219f8f.93.2025.02.19.00.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 00:51:06 -0800 (PST)
Mime-Version: 1.0
Date: Wed, 19 Feb 2025 09:51:05 +0100
Message-Id: <D7WALEFMK28X.13HQ0UL1S3NM5@ventanamicro.com>
To: "BillXiang" <xiangwencheng@lanxincomputing.com>, <anup@brainfault.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH] riscv: KVM: Remove unnecessary vcpu kick
Cc: <ajones@ventanamicro.com>, <kvm-riscv@lists.infradead.org>,
 <kvm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <atishp@atishpatra.org>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
References: <20250219015426.1939-1-xiangwencheng@lanxincomputing.com>
In-Reply-To: <20250219015426.1939-1-xiangwencheng@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_005109_184984_D82317A6 
X-CRM114-Status: GOOD (  19.86  )
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

2025-02-19T09:54:26+08:00, BillXiang <xiangwencheng@lanxincomputing.com>:
> Thank you Andrew Jones, forgive my errors in the last email.
> I'm wondering whether it's necessary to kick the virtual hart
> after writing to the vsfile of IMSIC.
> From my understanding, writing to the vsfile should directly
> forward the interrupt as MSI to the virtual hart. This means that
> an additional kick should not be necessary, as it would cause the
> vCPU to exit unnecessarily and potentially degrade performance.

Andrew proposed to avoid the exit overhead, but do a wakeup if the VCPU
is "sleeping".  I talked with Andrew and thought so as well, but now I
agree with you that we shouldn't have anything extra here.

Direct MSIs from IOMMU or other harts won't perform anything afterwards,
so what you want to do correct and KVM has to properly handle the memory
write alone.

> I've tested this behavior in QEMU, and it seems to work perfectly
> fine without the extra kick.

If the rest of KVM behaves correctly is a different question.
A mistake might result in a very rare race condition, so it's better to
do verification rather than generic testing.

For example, is `vsfile_cpu >= 0` the right condition for using direct
interrupts?

I don't see KVM setting vsfile_cpu to -1 before descheduling after
emulating WFI, which could cause a bug as a MSI would never cause a wake
up.  It might still look like it works, because something else could be
waking the VCPU up and then the VCPU would notice this MSI as well.

Please note that I didn't actualy verify the KVM code, so it can be
correct, I just used this to give you an example of what can go wrong
without being able to see it in testing.

I would like to know if KVM needs fixing before this change is accepted.
(It could make bad things worse.)

> Would appreciate any insights or confirmation on this!

Your patch is not acceptable because of its commit message, though.
Please look again at the document that Andrew posted and always reply
the previous thread if you do not send a new patch version.

The commit message should be on point.
Please avoid extraneous information that won't help anyone reading the
commit.  Greeting and commentary can go below the "---" line.
(And possibly above a "---8<---" line, although that is not official and
 may cause issues with some maintainers.)

Thanks.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
