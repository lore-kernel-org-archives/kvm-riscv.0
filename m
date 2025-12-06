Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F65D3ABC9
	for <kvm-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 00:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4tGItZpiLqNDxjyjxA9w8IhFsk5pH/8GwS0YToznmMU=; b=sxjJ0Cn06rxv+8
	hGQSCbF3mYrMl8uQlJbjNsAyEARllAkUzMGELpM1CTpd25cYLzC/+PzCFjCtgm4Y44f5XK0soW8aQ
	Bu/5fMMV4qyWiAsFANJK1njcaNpWMmL9305TxCisqEg6QUs6zr0brNWbqLg5qNkL5GQLbZa9uiN9A
	2cZfofeNdx9G+hsUsTnmwSOzTdr3fiJBKoYkJZbR2kZuCircNcPrbeh4wQE/AdPXJy5J39UiwiRWz
	ZmG0wT+OVDAze6iEl9s2/Zm3u/Zgx+9kSvRnWvuahiR9bj+550FBfcT136cozuDyj2cYgwIN7P8HU
	g6TxNF/rPmnXylTmVjVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg1S-0000000AHaL-2Mhf;
	Sat, 06 Dec 2025 00:19:38 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0D-0000000AFLc-0xg8
	for kvm-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 00:18:23 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-349aadb8ab9so104586a91.3
        for <kvm-riscv@lists.infradead.org>; Fri, 05 Dec 2025 16:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980298; x=1765585098; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=3dnk2MNp76sLgAxgNfD42hkkfZBnnHFIERQ6eKlhSyM=;
        b=Mn1tcBBpXq/B5+kpfqS8u3CnMAJGZlzv/xgIKrXyDnjPDlza3t7BcriIkogVKTOKeq
         nZu3cLgyxv6WbO5ByYzHgntuxNZm1NKrNJi5USPv6FraiXiKRiIPFQQNtJPLcG9qSV3b
         +UxSEUSi+k8gSXmZ1xii0Y7jHsTBxnmwPJhw1l5jVyh6fz/g4/oZw7SrFOcwzj4LCHAz
         7D7AGPYHpnWF0V+Trrnak8732TcMtWB+PxClJ2DmkUQGTSftcALBAJomEoeQe8YZ21Z0
         vrjq0Zki+PRJ7OjgkDlgabUk1ZVtbaeIsim1GgHpwayefi//zejM9Jp0XA8Kk9JNQjpV
         YHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980298; x=1765585098;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3dnk2MNp76sLgAxgNfD42hkkfZBnnHFIERQ6eKlhSyM=;
        b=lwweUijwHdI47xFMTiO9ZZzhbzBYEtUZC+CMk+hPSeo0IdynjukqmdZG5+IJ3pzqIV
         tTxjlsnjGbhjQe1XwE7TZISxkR17hQ+MUyybjxJ8JhpCcF98ZXI5vJGtkGgRPrG4JTuc
         E8Sspnr+OYzdcgK+8DdOD6EPEIiAsPgHrkG1zIgtd2+JKba/E6vllE7RwnFE6A9fOGi5
         XHQ3Bzp1l/s31RLA8f+DX6MWyTm0fkKleELAtceEASyTxcJTurYUInBc9O5Fi6F+Fq7Z
         xrNDJ1I22QslQKX+4tggXoJK9KJ80z7ETrn+fManfXsnBLMDJzyVNeorEEtiryWhH15Q
         6Xsw==
X-Forwarded-Encrypted: i=1; AJvYcCWO1ds7kMd2X3YvDFY9zBSVG3bKkmiMEW3QkQ6QXHgFMLY2Qs2FJYBAJ/yRZHKcHiI7OWpLEm77c8o=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk5MhIFQd9epWNfG6b+YupGSo8BkB0yymHG7fUhbRwUKyxn0+T
	21XyVp8RuSMAp5r7o2M7UKdxlBf2YqbDSoQR4gA2AB9BJ6lj2J6c5M4HPumTAahAcdVNmAnKXvp
	e5WKcFg==
X-Google-Smtp-Source: AGHT+IFWJxm66Taju4sAXeG8Zi046j5cUgR9dVl+uDTUXVS82TWmhcnKPkrnyr1pnneTXazQsF/t/WHWvfY=
X-Received: from pjll2.prod.google.com ([2002:a17:90a:702:b0:349:3867:ccc1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c4a:b0:339:d03e:2a11
 with SMTP id 98e67ed59e1d1-349a2511dfemr604485a91.14.1764980298595; Fri, 05
 Dec 2025 16:18:18 -0800 (PST)
Date: Fri,  5 Dec 2025 16:17:02 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-27-seanjc@google.com>
Subject: [PATCH v6 26/44] KVM: x86/pmu: Always stuff GuestOnly=1,HostOnly=0
 for mediated PMCs on AMD
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
X-CRM114-CacheID: sfid-20251205_161821_403934_DDE6FD64 
X-CRM114-Status: GOOD (  11.28  )
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
Tested-by: Xudong Hao <xudong.hao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/pmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/pmu.c b/arch/x86/kvm/svm/pmu.c
index c1ec1962314e..6d5f791126b1 100644
--- a/arch/x86/kvm/svm/pmu.c
+++ b/arch/x86/kvm/svm/pmu.c
@@ -166,7 +166,8 @@ static int amd_pmu_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
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
2.52.0.223.gf5cc29aaa4-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
