Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69184FCE086
	for <kvm-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 14:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UeC+cq63UkeKSkGaCnIZ4H6aa5BjyaGIYQ/K6tGw6dM=; b=UxiLqyIZKJrJth
	e/pisO0RUO2dl6+aXya5KTMxq1fl79FA776GTx0aII4qIbcwnapBNXPGJrtHEit9FnWeHHE0iLuiu
	+YLKR18h4XF8TmfDmBru8qZ3U7bGrw/+dXMHQXSIJHEGNEEkVdx35hDZGjjmNFjmWMWxD3J3amdaQ
	V/f7Y3fLfdG6scdWZKbC+EyPeggwoDRh/Z0iHWyqefejIdinbmt2NgNxOaqn57FVYmXEm5XDa9z1g
	1QHTHOS8i4XutveXKxZYNXEaNGgs7kYcUdtov7gsI7jO+Fq8BInUNJeGPeQxYwVloEigcMh5hUkBF
	KMtsnbJ5JvlRVcDjkp3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcDx-00000006KDP-0dw4;
	Thu, 26 Feb 2026 14:20:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcDw-00000006KCr-2kKa;
	Thu, 26 Feb 2026 14:20:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Xs8FqUyiDcrl0oz5B+yrANDPYmzquqmYyOAUxwBeuIY=; b=hrdA0aRzs+SEonkajenoQuoTjE
	4NaB+Q+lKhP5AG1LBbnlfNRSmHfM28KlDknp/z+RlWe4kIrxfqSpsaxeuO74QkuNfII9CtUPW4aDG
	C5D/Ec5R2zJluCYOTRQ5JpMWQrVm5Sq1zSbi19Xoafx1Uwnk6xk4KTP0qDCYf74xXG8E1xu4Oam3R
	BugivNWM6scr8nsWtKByXlCARMo9Ypvjmj9SS9bCfKMlSNbx5GMS4zTjwhpvwbtXS6zJ4d+g3z2JT
	+z/ZWYUblzXySA4Fuz0flwf4cbwoM/r9qs0WMDXzLrFd3udyhzkSbSge/l3zykL92mpg9twMujE8K
	Y1lZ8GaA==;
Received: from mx-2023-1.gwdg.de ([134.76.10.21])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcDs-0000000B9PV-3Dc8;
	Thu, 26 Feb 2026 14:20:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cispa.de;
	s=2023-rsa; h=CC:To:In-Reply-To:References:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Xs8FqUyiDcrl0oz5B+yrANDPYmzquqmYyOAUxwBeuIY=; b=kFRAjPxJwJjd0qXf13kaowAQKz
	HiQEUqbA0ZYt14X0+5udRC0jEXqFp/RzBHKYyVT/dBe12a/BhyLM5sBvyYFOeG8QZHJdIgAVub6MZ
	22W1dhDLHaphiQjf5c7qD3ZaryOWIIJovDSUYFUTMDPsNYFqVBuZ8PFX4H4yXyyN3YLf6LulPlcKJ
	jMzVjGEiqc6YTi9w6H6IwQBsRKksNpxmauAyl3XQvLDyhpvDIMq8hfWfnHO8+sKKnu9MvKPBxxH+U
	kdEtlqe/JYaFj9qK5KClSqWauMfkhpxV49GFlYNIcielf6w70Pr2CRYcCRBoc8hUEhUO8DhmuZyhV
	Ijv76jeA==;
Received: from mailer.gwdg.de ([134.76.10.26]:47859)
	by mailer.gwdg.de with esmtp (GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vvcDe-006EHW-1b;
	Thu, 26 Feb 2026 15:19:59 +0100
Received: from mbx19-sub-05.um.gwdg.de ([10.108.142.70] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vvcDf-000AAd-09;
	Thu, 26 Feb 2026 15:19:59 +0100
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (10.250.9.200) by MBX19-SUB-05.um.gwdg.de (10.108.142.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Thu, 26 Feb 2026 15:19:58 +0100
From: Lukas Gerlach <lukas.gerlach@cispa.de>
Date: Thu, 26 Feb 2026 15:19:01 +0100
Subject: [PATCH 4/4] KVM: riscv: Fix Spectre-v1 in PMU counter access
MIME-Version: 1.0
Message-ID: <20260226-kvm-riscv-spectre-v1-v1-4-5f930ea16691@cispa.de>
References: <20260226-kvm-riscv-spectre-v1-v1-0-5f930ea16691@cispa.de>
In-Reply-To: <20260226-kvm-riscv-spectre-v1-v1-0-5f930ea16691@cispa.de>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert
 Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones
	<ajones@ventanamicro.com>
CC: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Daniel
 Weber <daniel.weber@cispa.de>, Michael Schwarz <michael.schwarz@cispa.de>,
	Marton Bognar <marton.bognar@kuleuven.be>, Jo Van Bulck
	<jo.vanbulck@kuleuven.be>, Lukas Gerlach <lukas.gerlach@cispa.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1687;
 i=lukas.gerlach@cispa.de; h=from:subject:message-id;
 bh=YZqp1yUGYjA7iib6n3620o4zfE8Rd3Vv7AqvASBWfHE=;
 b=owGbwMvMwCGWoTIjqP/42kTG02pJDJkLwuLnTzq5/x/L7easB2G+e5TrrqjMOON1av0iPe6DY
 n0fwnwNO0pZGMQ4GGTFFFmmCr5m7NvjwJOUefgczBxWJpAhDFycAjCRIlVGhv7fGxdd2smhEvNV
 al/AxIDu0CQOgTx+uSNia61n6Src52b477nhm07Xu5lrvjLaB8asNu69tMX9wf5P515qtO19sl5
 7GysA
X-Developer-Key: i=lukas.gerlach@cispa.de; a=openpgp;
 fpr=9511EB018EBC400C6269C3CE682498528FC7AD61
X-Originating-IP: [10.250.9.200]
X-ClientProxiedBy: mbx19-sub-02.um.gwdg.de (10.108.142.55) To
 MBX19-SUB-05.um.gwdg.de (10.108.142.70)
X-Virus-Scanned: (clean) by clamav
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_142012_945503_6AE5BA34 
X-CRM114-Status: UNSURE (   8.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Guest-controlled counter indices received via SBI ecalls are used to
index into the PMC array. Sanitize them with array_index_nospec()
to prevent speculative out-of-bounds access.

Similar to x86 commit 13c5183a4e64 ("KVM: x86: Protect MSR-based
index computations in pmu.h from Spectre-v1/L1TF attacks").

Fixes: 8f0153ecd3bf ("RISC-V: KVM: Add skeleton support for perf")
Signed-off-by: Lukas Gerlach <lukas.gerlach@cispa.de>
---
 arch/riscv/kvm/vcpu_pmu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 4d8d5e9aa53d..fd891750c31f 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -10,6 +10,7 @@
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <linux/kvm_host.h>
+#include <linux/nospec.h>
 #include <linux/perf/riscv_pmu.h>
 #include <asm/csr.h>
 #include <asm/kvm_vcpu_sbi.h>
@@ -218,6 +219,7 @@ static int pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
 		return -EINVAL;
 	}
 
+	cidx = array_index_nospec(cidx, RISCV_KVM_MAX_COUNTERS);
 	pmc = &kvpmu->pmc[cidx];
 
 	if (pmc->cinfo.type != SBI_PMU_CTR_TYPE_FW)
@@ -244,6 +246,7 @@ static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
 		return -EINVAL;
 	}
 
+	cidx = array_index_nospec(cidx, RISCV_KVM_MAX_COUNTERS);
 	pmc = &kvpmu->pmc[cidx];
 
 	if (pmc->cinfo.type == SBI_PMU_CTR_TYPE_FW) {
@@ -525,6 +528,7 @@ int kvm_riscv_vcpu_pmu_ctr_info(struct kvm_vcpu *vcpu, unsigned long cidx,
 		return 0;
 	}
 
+	cidx = array_index_nospec(cidx, RISCV_KVM_MAX_COUNTERS);
 	retdata->out_val = kvpmu->pmc[cidx].cinfo.value;
 
 	return 0;

-- 
2.51.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
