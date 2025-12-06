Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF95DD3ABC6
	for <kvm-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 00:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fPNGu/xp7HGlm3UoHp/oaJOTsORAE+MLaOWYwyZ2h4c=; b=ZcKuNCcuvcJs3x
	anhZLTCF707NIouND72ZS3WaZ0xX+ggp3u9Zki0Ed5DPDLqVxg94kk79W0yBg0uDcdY+/lO3qGJJn
	sA8Gx6TL0DnmT/cBcanu+ZRdahF0/kMd+dw85a7yN21z7Ivao2G8ATFxjCUFVxiWVK7YENR9bp+pJ
	lHnXX7SIfG1aMpn4kLpI7EOLobXJlnjBXA5O1PJMXe5wPwkk/v5LUS7diEM35YLZ4dR2hNtzqLCVs
	H4B2U8jz5VuAOQzkbbsvMV6m7Yzxc4n/pTfTSKRaAvTirC1wzZl9nD6glAWjZ50/qjfAKbfmthKHj
	rIGkGCTWrGunQ/sl6xNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg1C-0000000AH5v-09fg;
	Sat, 06 Dec 2025 00:19:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0B-0000000AFKA-0nFs
	for kvm-riscv@bombadil.infradead.org;
	Sat, 06 Dec 2025 00:18:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XDWqFeiOQLKkxB3EbvG31YUh6Q8If2ANhLHUmz0BNv4=; b=HFJhYyK4PbIVSxSIiWdKZ0kyJK
	pzN5yX2BYXRz10Ho+Nj7xxgcVCF39CGIhURNP4LpL98MMcehYo3DMIv29UQeEJ2KFK10txvznZcu8
	XwTqhiyF+dtf35JApGFyJPf+lFvhQqX/O0Vjgxv27SNBc8S4SRNtk5X5+wzG58goSUuOPnt/Qu26u
	GDvj+eVPs1fvHoEXRzwmzNHT5T6KkUKHUYxOTe6X7TppDr3qjpAIvjj9CxgizitbhwL4RzqR8Gwpf
	YdW6FaxswoG/29fsQ+oRY+m8wFbIWsDg2IbF7/33ac3iqMmN5m0E2TXBT5T7ul8/+ShiyD/nuT5pP
	n5m3ERJg==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg07-00000006SOY-2av8
	for kvm-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 00:18:17 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7c240728e2aso4692581b3a.3
        for <kvm-riscv@lists.infradead.org>; Fri, 05 Dec 2025 16:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980292; x=1765585092; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=XDWqFeiOQLKkxB3EbvG31YUh6Q8If2ANhLHUmz0BNv4=;
        b=S/tJWsnQuwqKbhzjDsy9mkfNKxew1fhGU/sMIMsJDzLVvl1MzxNYxQApvRQOlJPB3f
         JO/Gr37ZLU9pKSbBynXD7KlITWHUkqwp20pEfYD6wmEAUieVmgFTMdffPjWOyXxngTvz
         oNO/eAVpT4ydraLPCbBkMxiUF0jcYJFpvs9TK30ZUOyLvSZl2f8KbPmGZ5vb9JYiUNgQ
         hUS9SUeDh9Q2NSZmp5i2K4pbAs+c633BKpEZepMEkn8XrCfHbqdYmovOoMfz5UUNDiz3
         dOQhHFBhnIl4LdJS6rmkREiP6Fu5a2P2bWR1nlazL7STa7BVpXM5yp2gXd7vxR8SdYd6
         5Vmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980292; x=1765585092;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDWqFeiOQLKkxB3EbvG31YUh6Q8If2ANhLHUmz0BNv4=;
        b=KZRayFPX6HmYnQlSSDnlxJIyEzfV+sx36uhXANTCIsS34lo30Gye2g6OqyUp911avD
         /LNNdmr2wn8hyoJwB6k6eELTt7XhBn8NxNzz8UyWFrH0PxNj6ejt74pH/OFZkOq18Q8v
         4E+1DxyTr/k/oSdMgRnlO5jHGI41KNFo7FQiZd+MrL8O72dD3NA5E7AJeqAw53h59wbE
         h1Y36pMJT53mlJxLdQI8P3rU+nH2GpC3OyCbZTgiQfMIH8G2GJuC7pL8DA7PW1jvRNoX
         MVrzSrg+WoOZHMhRRWsSbJ181NPiPWtAVKPkBxfLuZrvJ4C13RaBKX0Ka7jRrc/JJLkV
         7krQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQrzL+gzIiFNBfXWBfxx88tgAIDNCivYt3DEhEaN5YdaiUe3KR9ubtALVs8flS3WcRwufce8PxZ/4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwBPEvxNsMkDH8656ksnL0LtSVD1dL1aSsEJzBSsnvHpWh/HwLX
	W8yyGkNZSNh+WxQtUnGTAn3DbNZ0bmEF7an8xVZJUaguzLd7b1NjoRF0T2qnLLZVQsxOPx7zeb3
	GFCOX+g==
X-Google-Smtp-Source: AGHT+IEUzuqWf57QLYzTtVTMaTDzv0I3kjHOLmfOTP6Jt6doQKesYDsCDJnJjl04ZJwHyBMoU/64HyX4VwM=
X-Received: from pgar12.prod.google.com ([2002:a05:6a02:2e8c:b0:b63:2a80:d077])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7f81:b0:334:912f:acea
 with SMTP id adf61e73a8af0-366180175c0mr936268637.59.1764980292181; Fri, 05
 Dec 2025 16:18:12 -0800 (PST)
Date: Fri,  5 Dec 2025 16:16:59 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-24-seanjc@google.com>
Subject: [PATCH v6 23/44] KVM: x86/pmu: Bypass perf checks when emulating
 mediated PMU counter accesses
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Mingwei Zhang <mizhang@google.com>, 
	Xudong Hao <xudong.hao@intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_001815_734347_B07112DC 
X-CRM114-Status: GOOD (  10.32  )
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

From: Dapeng Mi <dapeng1.mi@linux.intel.com>

When emulating a PMC counter read or write for a mediated PMU, bypass the
perf checks and emulated_counter logic as the counters aren't proxied
through perf, i.e. pmc->counter always holds the guest's up-to-date value,
and thus there's no need to defer emulated overflow checks.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Co-developed-by: Mingwei Zhang <mizhang@google.com>
Signed-off-by: Mingwei Zhang <mizhang@google.com>
[sean: split from event filtering change, write shortlog+changelog]
Reviewed-by: Sandipan Das <sandipan.das@amd.com>
Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/pmu.c | 5 +++++
 arch/x86/kvm/pmu.h | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
index 57833f29a746..621722e8cc7e 100644
--- a/arch/x86/kvm/pmu.c
+++ b/arch/x86/kvm/pmu.c
@@ -381,6 +381,11 @@ static void pmc_update_sample_period(struct kvm_pmc *pmc)
 
 void pmc_write_counter(struct kvm_pmc *pmc, u64 val)
 {
+	if (kvm_vcpu_has_mediated_pmu(pmc->vcpu)) {
+		pmc->counter = val & pmc_bitmask(pmc);
+		return;
+	}
+
 	/*
 	 * Drop any unconsumed accumulated counts, the WRMSR is a write, not a
 	 * read-modify-write.  Adjust the counter value so that its value is
diff --git a/arch/x86/kvm/pmu.h b/arch/x86/kvm/pmu.h
index 356b08e92bc9..9a199109d672 100644
--- a/arch/x86/kvm/pmu.h
+++ b/arch/x86/kvm/pmu.h
@@ -111,6 +111,9 @@ static inline u64 pmc_read_counter(struct kvm_pmc *pmc)
 {
 	u64 counter, enabled, running;
 
+	if (kvm_vcpu_has_mediated_pmu(pmc->vcpu))
+		return pmc->counter & pmc_bitmask(pmc);
+
 	counter = pmc->counter + pmc->emulated_counter;
 
 	if (pmc->perf_event && !pmc->is_paused)
-- 
2.52.0.223.gf5cc29aaa4-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
