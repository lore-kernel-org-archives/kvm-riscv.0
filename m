Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D57F5A8C5
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Apr 2026 20:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=g4ScG2zH/ODIBsUvMLnbh0Kl0k/OmrdLFgCf81USDlI=; b=q/TZ7CYj1YgMP8oRRGP9bReNmr
	YgRiT8xrww8+b7IRgHxZLdO+NUk9EpLnSv5GRZgLwDi8nmNT/SKfMe54m5vodXRf70HN6P4Fbmli2
	b450s8BxD6wp6UllVEUD7JFz9Ux7ranT77lwAhab42sDkPcLAVE8lFLi4P394QjDTlpUl8w5ljM9A
	xN+McrO9w9AB0+Wu2W/L3ktKx2Fqzk1YthSANfGD/ejyyPZueFHuGdnEbN1V30VahBjlQCrPIev7Q
	103cH8q1BknUr9x/vnZ8oiCRiIrnoaaCj3ndTBSyx6JAbn6slAzeodsWLRlKRo0r+W2PaRVIrZcoC
	Te3zxTkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEvSt-00000007dbn-00Q0;
	Mon, 20 Apr 2026 20:43:31 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEvSr-00000007daq-0ouz
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Apr 2026 20:43:30 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2b242b9359aso33970645ad.0
        for <kvm-riscv@lists.infradead.org>; Mon, 20 Apr 2026 13:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776717808; x=1777322608; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bw/xOa4cMDz+3Y150IRREEsvI8FeQ6LscRd2k8rTaIk=;
        b=HGu8nbHdwEH1ht1VIiu5NeqGRskHHXBu4YE2oH1pg0ZyAuKaPKL6y1ZUY6gJ8/58L+
         B2U9vOWiFPiYDNBB8FUcWHb0TuuPUBQLBgmgctj69Sf836fT5WpYm9FP8wwvfyj1Btde
         DsNj8+j2FNKMzfe4ubkCKGvNOC4JowrN5wJugMjQJN/SBIPKuFuiDjpZd4LwGUfkaevW
         yJ+eEqTuWsC5R14hhFHyPefVtaEnSasShodQJVSn7nqTbL52Z3mlBajXavwIEjUjs3WJ
         nl/CdJ0PA0KkDeTY2J5dFX3B1Bqr+aAumg/ID8mrL6QcbJ74ZoCGiI09/1FzyaOyMXQb
         jXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776717808; x=1777322608;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bw/xOa4cMDz+3Y150IRREEsvI8FeQ6LscRd2k8rTaIk=;
        b=B1Op+iSXaf3GpYZulktaZDjgch3kyJlTAm9NEIdtXp655Pv+j68CAbnyH/ja14KXFI
         yPjz2hQTzvPhlSdNkbabcWHJ9ji6+bmv/+N/WykCIHWx8fx1q7Fiv/qEkXj6ebr3REJv
         +fzy3NOuuujYV77CDgmfimDEOia8EHEpOrtUb10yGelM8xqurG9faVuA5AOdYSz0etSn
         0YotxuIwbAgOYtAPYKD3dVnyHN0TKd3oRx9WKlAcKW3ZWmq0rwxUzrHnDKC/xMOBXmNO
         6hPoIiOgGZgB1lLsCzjwV44Erb+i5faKEiLk3sXEGF86+7ZYZTXfb/sozZW4/1/nviKi
         GAKA==
X-Forwarded-Encrypted: i=1; AFNElJ+4JlAGFVEM01z5zXDy1EHXU8AGekjt6yHgx4+Bh77kM+T87YS0ZFrxJpat+/7uUeCfXcSMglbOB1I=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywiq5P8BxmSQGE70dfnT5LfWxr8FVu2URMm1QAnmxRZ5qcRY3+u
	4Cqi/C80QrMWVZh2n3gxL12/v1rHIu1MS6JHWSVEPZQZWu1F2pEIOWnf8we8JLQGGNTCcbpsxfi
	SNOnlLQ==
X-Received: from plai2.prod.google.com ([2002:a17:902:c942:b0:2b3:2649:c9c1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d30b:b0:2b0:673a:7c90
 with SMTP id d9443c01a7336-2b5f9f50051mr108270095ad.28.1776717807739; Mon, 20
 Apr 2026 13:43:27 -0700 (PDT)
Date: Mon, 20 Apr 2026 13:43:26 -0700
In-Reply-To: <20260220004223.4168331-5-dmatlack@google.com>
Mime-Version: 1.0
References: <20260220004223.4168331-1-dmatlack@google.com> <20260220004223.4168331-5-dmatlack@google.com>
Message-ID: <aeaP7kPPlyBZE-1h@google.com>
Subject: Re: [PATCH v2 04/10] KVM: selftests: Use u64 instead of uint64_t
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ackerley Tng <ackerleytng@google.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Bibo Mao <maobibo@loongson.cn>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Colin Ian King <colin.i.king@gmail.com>, David Hildenbrand <david@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Houghton <jthoughton@google.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lisa Wang <wyihan@google.com>, loongarch@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Oliver Upton <oupton@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Pratik R. Sampat" <prsampat@amd.com>, Rahul Kumar <rk0006818@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Wu Fei <wu.fei9@sanechips.com.cn>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_134329_268096_C78323E2 
X-CRM114-Status: GOOD (  10.77  )
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

On Fri, Feb 20, 2026, David Matlack wrote:
> Use u64 instead of uint64_t to make the KVM selftests code more concise
> and more similar to the kernel (since selftests are primarily developed
> by kernel developers).
> 
> This commit was generated with the following command:
> 
>   git ls-files tools/testing/selftests/kvm | xargs sed -i 's/uint64_t/u64/g'
> 
> Then by manually adjusting whitespace to make checkpatch.pl happy.
> 
> Also include <linux/types.h> in include/test_util.h and
> include/x86/pmu.h to avoid compilation failure.

kvm_util_types.h also needs to include types.h, as it blatantly uses u64 without
any includes.  It obviously works thanks to ordering, but it's a lurking trap for
others.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
