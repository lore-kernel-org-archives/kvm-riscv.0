Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65DCC87FD3
	for <kvm-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 21:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ntdt9zqib+0zRUgE1U2PDZKB4c4WZAcDsxCRtqBNC/U=; b=mnvlXxW05gAkcf
	ieA/x2LW3fmU4GhAos3wZCf8d5dMXBDww0F5u3kdEYV13ExLQHRWWeAFMkgGk9nBtxqObkyWeWzKS
	Geh1ruJ+m0kKa7hh7g0fp5ZWc07o2tgoZ6qTFIooCzIWlCvt/UnlDoFdp+td/9W/iM1g5ylsWYc3y
	kmGM1f9rAI2p1fjvunrO5TyxPI4TSnE7PVhk99Be6BlnqSbgAPJGBKZP/7ZKu3kIu7It6a/3mDxC9
	74BvQ0dCdnWlmZ9ot63JbUoXC0O4ek9p1qDwEGxvO8pEUxGCksq70nC2ijiYYu+fjFNCeDDZptpT7
	5gb5gdjjbRmrbqirUebw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujljh-0000000Ga8J-271i;
	Wed, 06 Aug 2025 21:31:49 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkHT-0000000GH1w-1lpE
	for kvm-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:58:36 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-23fed1492f6so3159995ad.2
        for <kvm-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510314; x=1755115114; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Pi5hsDnuks7nSFD8RayInQ9oz1eBhk4hTX7Cx/64BFI=;
        b=Hgl9Tqxu6scnD6Ula4H6HuF6vdt3hQIXl969ndEoyieBVaCpSgeL/g4UYDUi96RLth
         W/seyHigZQWitduwsB1FKT+tkFBjHyHQ/PrIst7umtMi846F+HavWIw8w4x2ngHUf1+O
         TiUFQdo0fvj5vrZIZz/BoHeV34olo8bnKxjTOPsqMHyNU9CCoR1YCmywf0InPPVcfBqF
         AmPvu0mQrvnPByfQl5zIqUO9idbWaX4CV0OckCgXRlEdVQ26VjThQbL9quB3zbnmQyfZ
         a065ZoLO/dmjT9U1Xf6VeJl1sfX8ZLmDZ9VcbNs+9MTIKpiKLcghh4PYzEBRLiSx4/SY
         +uhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510314; x=1755115114;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pi5hsDnuks7nSFD8RayInQ9oz1eBhk4hTX7Cx/64BFI=;
        b=eFYnx4UgBlBy5RAXO6MCN9A48mwbaZWwwy+68uQtlHmM6Vjf6nSz8gLtJAUlmZHE06
         3g+o/q79jblDcIM61Tqq9TeFCLw16tp5PO7e/9hBYfY/E00AjRCvK04CgkK8+xksAhYN
         8CK0031+NzXL7vRvAWWBduahUA910Z2r8ZMIIajZbNZdWnUeG/sP3cXSr9/+qaZ/xGJ1
         AjsREhGfl79Ot+Z6FQaJc2llRQSNnsGa1xAYW+6/SAmuXtjtTdBt0h5D08OPs4A66NYF
         rkOMlLZbPIeOZZuuNhUez1lvZ59oKXbKOPWi1OUhY64DCNFQq78b1X5wPSjho3cS+mlU
         JyXw==
X-Forwarded-Encrypted: i=1; AJvYcCVfYDR8/7nFM2kq8rYWLG9gVUlq/3jSo2khpsSYrK3Vq/Szh+vPH5JDYqXEGsl+Opniod3Se2zBK5c=@lists.infradead.org
X-Gm-Message-State: AOJu0YykZ1zBjyoteaiSqv+LfgG68RlADrxgfircehLMQ0UQOn0j3qXs
	VwtIkgbhlo607Bq9ZxI4GyjWIjZNAnG4Jb+HzW7YT2nKwAjhF6x1xxfnFhrc3ADa7E2BaLkNqVQ
	Hdmc5JA==
X-Google-Smtp-Source: AGHT+IEJD5GH7UI5TAAlffejmtsOUdJu9B+mpPPWAxLwTCJvZJKLbNbFAds3hHNJ28h7v90ap7LjckKJrbQ=
X-Received: from plhl7.prod.google.com ([2002:a17:903:1207:b0:235:f4e3:ba29])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d581:b0:234:d7b2:2ac3
 with SMTP id d9443c01a7336-2429f2eea48mr59065095ad.20.1754510314065; Wed, 06
 Aug 2025 12:58:34 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:58 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-37-seanjc@google.com>
Subject: [PATCH v5 36/44] KVM: x86/pmu: Always stuff GuestOnly=1,HostOnly=0
 for mediated PMCs on AMD
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Kan Liang <kan.liang@linux.intel.com>, 
	Yongwei Ma <yongwei.ma@intel.com>, Mingwei Zhang <mizhang@google.com>, 
	Xiong Zhang <xiong.y.zhang@linux.intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_125835_551309_96044481 
X-CRM114-Status: GOOD (  12.44  )
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

From: Sandipan Das <sandipan.das@amd.com>

On AMD platforms, there is no way to restore PerfCntrGlobalCtl at
VM-Entry or clear it at VM-Exit. Since the register states will be
restored before entering and saved after exiting guest context, the
counters can keep ticking and even overflow leading to chaos while
still in host context.

To avoid this, intecept event selectors, which is already done by mediated
PMU. In addition, always set the GuestOnly bit and clear the HostOnly bit
for PMU selectors on AMD. Doing so allows the counters run only in guest
context even if their enable bits are still set after VM exit and before
host/guest PMU context switch.

Signed-off-by: Sandipan Das <sandipan.das@amd.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
[sean: massage shortlog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/pmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/pmu.c b/arch/x86/kvm/svm/pmu.c
index 9641ef5d0dd7..a5e70a4e7647 100644
--- a/arch/x86/kvm/svm/pmu.c
+++ b/arch/x86/kvm/svm/pmu.c
@@ -165,7 +165,8 @@ static int amd_pmu_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 		data &= ~pmu->reserved_bits;
 		if (data != pmc->eventsel) {
 			pmc->eventsel = data;
-			pmc->eventsel_hw = data;
+			pmc->eventsel_hw = (data & ~AMD64_EVENTSEL_HOSTONLY) |
+					   AMD64_EVENTSEL_GUESTONLY;
 			kvm_pmu_request_counter_reprogram(pmc);
 		}
 		return 0;
-- 
2.50.1.565.gc32cd1483b-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
