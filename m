Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9391BCCF9FE
	for <kvm-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 20:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CFhVhyMtxWtPvpKUARmUEiec/dgWV1r4Rs4ZIDpV2UY=; b=XTh5FWaXconhAh
	zoCAhV/DUaIDEbrCUNeK9q0Fh63SiCHJA9/qsAqqWc3KFb1MOJr1iprgn9t8KIDczZy/rFm7GkFDs
	bjd7v3Ageih3ffXb6f1kuSbFFRDSw8rKMfMmLYIK89Jma+Cp91HY4TbBD3WzOvZ0nkW18imPD2uDw
	7lP1o2K/Q0p9MQCc1Dr6t0w8Y74ZhzOApyndQlBvlQDedLunGkryAHyvb7EW/wJmAcXVWqhSFDmZx
	NmAaglSl75iGyEKKuSKj2MiQ2UOaopcTMR4jlwBPCyLKldw02H24Qw4N+XTCoKK73Bx+DmlWbrMjl
	JP92yJpyGBLuMdKsmRcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZ1W-00000004nH0-3SQV;
	Thu, 30 Oct 2025 20:13:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYzC-00000004kSJ-0Wv9
	for kvm-riscv@bombadil.infradead.org;
	Thu, 30 Oct 2025 20:11:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZPfEDjublRysEg+wBq1Bud0evQ6Qw3SUr7bZgrR40cM=; b=UrKhnUkOKHoSkF3kfGpWSXzFNU
	eWnf/TOoy0fzcdGCFlgEOegvpTBNOVkVAav/iQAFtX7BOYe2j7/amtTqNcacjWXW0Ov+NO4RtL7cB
	KEw7XSRkZdc9lrHtyNQj+Ol/9uyQebQsBc3vqhLt0AehUUeGJD5el8ZzT93tKvMJ3MeDPRBQgUND+
	iutLtGrhWW1wB908SbEyRtYujYiwm7hS/84vmIASRqG7YbBqT1s9VD0u6lEgk+pSbZAA6SFYzSQ8e
	GiOkqbwKNWOUclgW0Lpxg0RAFcLuJ6r6M4zqzS1PKwoO4Mrt8I8yf1+38GRUHfBdw5WZaeF89khu0
	Mm0ixdlw==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEY7P-00000009u2c-2msB
	for kvm-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 19:15:33 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-78117b8e49fso3032873b3a.3
        for <kvm-riscv@lists.infradead.org>; Thu, 30 Oct 2025 13:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855059; x=1762459859; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPfEDjublRysEg+wBq1Bud0evQ6Qw3SUr7bZgrR40cM=;
        b=BZEy6sKojx1/5VyFaR7VFj7gf8fisYugky15YQtU4iG42ImKOkFdkp1sC5/4DaHYsa
         HjOHidf20oKX7J8JS7PKtn5D/LHOXidgpKCCYNHr5k04Cv+QmxaI8ymfVjl1M85ZyQaH
         cGmo/dOdEk8CgtObaiAHrTJQt2Kv/6cf/HqQC759katrXs9mm9mGm7qWe+6AzWJB38yI
         TGXL9WyVlAoc3vnsIe2+m7YronPGQgZ22o/XeSKcmSZMZeCdqixlgNPCGh8NgEcCksR/
         j+R8CdXlWnIUs3rU4FSEOysVjGnjTajr0K9nfx1fGAcP12qx2MSJc4QdvP36Dg7yXt8S
         skyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855059; x=1762459859;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZPfEDjublRysEg+wBq1Bud0evQ6Qw3SUr7bZgrR40cM=;
        b=Al7ZuWS02IwCo0vLnmXmkt6tgb2bQdXz2H1KgXOiYDN/n+14aDnn3KAnflFH4fiQmI
         2kFZ368TYSga6vcqNW624jHjvGYCeKWkRh8HozzKNewYtltFh+DTlNHJ+SuxL/QY5MDb
         3iDNaePv833VG5po4xSOV6a9NKeqNoEUlKcT0U0hTSm5d4MIh2AdAks1TwPWFmlXzRGh
         WmwTBMw4oNESYP2y28LB533jGutdJNp/gFwX9u9XZyJvvgyg8BCiByeV5LGA+a02R8r2
         p2H1YRF/8hpNSY3ZfSMyiaWiqhqYOH1/pOllKFF6Yy3uvWDYJcrhz5ex3WD5WPd2fCVF
         iixw==
X-Forwarded-Encrypted: i=1; AJvYcCVnrZu2wGHkN+aSp4mc9d77Z69p7U4uX0nYG5X6Z5bnACXHx2vHPBMc4tHbkbu+DfO+tRnhVJm3t6M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7UPiwmTpzhjLgoLcSrzF6vNVoiJCh1giXrYgFhf2sYYqWF4M7
	hgvskHyZNlrZK4TnPMjS7QYhngNJ02m2n32rhg3SH032wAiozbFzBxSanEcTCMzNDFFtPqIzbXX
	N5/5AKg==
X-Google-Smtp-Source: AGHT+IE4oqFNhFQQZr1IyqSPUxhZWizKY8+4h3k61YypjXkX/4HyRwAM2GyKD7DH49xWshMyjNqw52ssRLY=
X-Received: from pfbgi4.prod.google.com ([2002:a05:6a00:63c4:b0:793:b157:af42])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2283:b0:7a2:721b:adb6
 with SMTP id d2e1a72fcca58-7a77a9cb11amr747302b3a.28.1761855059275; Thu, 30
 Oct 2025 13:10:59 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:09:47 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-25-seanjc@google.com>
Subject: [PATCH v4 24/28] KVM: TDX: Use guard() to acquire kvm->lock in tdx_vm_ioctl()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_191531_744133_AEE34315 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Use guard() in tdx_vm_ioctl() to tidy up the code a small amount, but more
importantly to minimize the diff of a future change, which will use
guard-like semantics to acquire and release multiple locks.

No functional change intended.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index d6f40a481487..037429964fd7 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2806,7 +2806,7 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
 	if (r)
 		return r;
 
-	mutex_lock(&kvm->lock);
+	guard(mutex)(&kvm->lock);
 
 	switch (tdx_cmd.id) {
 	case KVM_TDX_CAPABILITIES:
@@ -2819,15 +2819,12 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
 		r = tdx_td_finalize(kvm, &tdx_cmd);
 		break;
 	default:
-		r = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	if (copy_to_user(argp, &tdx_cmd, sizeof(struct kvm_tdx_cmd)))
-		r = -EFAULT;
+		return -EFAULT;
 
-out:
-	mutex_unlock(&kvm->lock);
 	return r;
 }
 
-- 
2.51.1.930.gacf6e81ea2-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
