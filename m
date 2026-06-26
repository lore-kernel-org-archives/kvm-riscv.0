Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06326CDE008
	for <kvm-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 05:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ImC9G6nWXxhC9zf13d+17iZZ4sWAzDLiQ6+ZV+yJNNM=; b=K+qwn6/420y55D
	i8b2lzbv6KPzL1Fhs073YoCYHdzk9C9/zFsOfuAqpXkefWnf54lOnUVE6C9fqSqOU5bRsLRnsn96X
	2aNSjOfDceFIQWCwykesAUrU4k7DlYY2zx09Bi7l59nPZMME2wj2WENknTUeQGXNuPyOy7lo20cY1
	K9ipoxhLTc/IuBHU7IBSwuBXetpuGTmSbv4rBKHhAk/gI/qsZosVJH2t+5P8b7N1GI9Y2nQyeyL0i
	FcjmEf221ObssLY79juH7+pAERzKpe3oFl9c0lMs8MWaNrv3/dJxvGSqSX1JO0FI7faIaESarsNxC
	FEvHL3IO8IOqtGbNqAaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wczJc-0000000AXAD-1rXs;
	Fri, 26 Jun 2026 05:41:24 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wczJZ-0000000AX98-1C7T
	for kvm-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 05:41:22 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2c80d215169so6134035ad.3
        for <kvm-riscv@lists.infradead.org>; Thu, 25 Jun 2026 22:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782452480; x=1783057280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rCn8lKg7NgEt+UxeSdKd7uOIi/uWFv3vSqBPrzK4a4k=;
        b=r6/LXVCClKRkqITa0y2Q+PkL24dWset0DN5X3ffdK+Dh4+0ks0onERRdbUHaLJsbu5
         Uc+Fx265P9zYRY+6VMekq9cqG+bYvdlNcwlQmQBFftIEXWKxgOXjb8y8JrZLRNWHx8si
         RlmKCUl5Yky4gfibQovDHZ3StNVbDijvEC3yq/gQ7NlXTsoKEg8V38uz6QsSTiO47Ds2
         iUtX+xTfjZar4jjVXSezSY3HkKLqmdptOKwNuAejyo3h3SlO74WsADBmxdAxxfBg8vOF
         iyKHYzQVJrsIfFTxDiCEKZgkU1z+hzyXyZZ+DiF+GJOhEpAMXDyOYcPAaNLdQdewZz3K
         4k7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782452480; x=1783057280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCn8lKg7NgEt+UxeSdKd7uOIi/uWFv3vSqBPrzK4a4k=;
        b=WRpnIwp0aSIrvsO2ssxiADyFLzeyxX6sXrWxm9Ghava8MA3GyJnWrAmvqPtqzUgU/C
         0RNE89nmuGOJwkSCs9uHMl3IzUvVpc4IEXh76fQPX6gq3TZe3w1tv8HT+DgJtMjqLg2y
         BvOZutOq1GLcVizcK45tCjBTIB0a+l0LBmBq8OyxIXgQf38cXYXNsonRgYE/px/20K1m
         d/gB+c1hKMukn4FkI0tnlioQHH0ZFGjnqFQxb9sRKGe/rIfxfbHkTZGL2Y6373tSbgWm
         8UirLSmI2xXMaXaZx3GfNoqSXv9CHxqdzy5KMXya+lPlGEVaH0RHB9hza2Gist9YRBqr
         pebA==
X-Forwarded-Encrypted: i=1; AHgh+RqOt5mzHEeaUJ2S3tScB3GoIzogr1mRzp01P0ErCMTYnmkloaNkdH/90GeOi6j4fFjGmEeza+fJSEc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0bQG+qXtchPF9sr7AqKlfkAbj909H4pK2S2R+r6VHHrcZHl95
	HWZUwX1+/wI1JW88Eec19C759ajCYu/Uy7PjWhN6Po6Ge8hdVaWkmIqL
X-Gm-Gg: AfdE7clEBIcF8g+3r2kkUYv9rt3FSlTpOsWhOjIlDlO4xAj6ylneT4ymyg9r65KQd8h
	8ijCZ0+ON08mlBJbxNlW7e++y/gO1K1tux6KSnCIax9IowMn7HxtLebzFmGdvXZebFzLgFaLQuP
	YnhjtBL+quVxXQGyzINdZEkTGX8Iz1DXhgBVmrfXIWq7yJAKJIQOGSD9yNscv7/q1seg7SIHj/M
	zq67sujCpgg0tmXPM7xENC7Cq6AvfYHwYbXWo6H6+cc1sb/7yVjZyn1EsuYtK/rlop7U1RM6oZI
	JBXy7jbx9afwheldfRVZlZ6HGew3muTHVWI89mWGxE3aScZd0whSn+SVRBKKVLC8s+5PEM60gvy
	n1AOfG9gj2KU1QmBivRjPj67HkFnWQVs1WCmRKRVCQq/dep3ZyFp5Xi89+YiDyv0/U8qN+YEfU8
	UZHDf0T60DMzxCkZTev6uzBmJ/QmIrE5aQX7zjUMnI0YqG74Pv8r3Z3rXSkAT+VMA=
X-Received: by 2002:a17:902:f552:b0:2c7:ef3b:e18d with SMTP id d9443c01a7336-2c7fc7366fbmr52715135ad.28.1782452479842;
        Thu, 25 Jun 2026 22:41:19 -0700 (PDT)
Received: from pop-os.. (118-163-201-11.hinet-ip.hinet.net. [118.163.201.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63b27f4sm32974865ad.53.2026.06.25.22.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 22:41:19 -0700 (PDT)
From: Shengwen Cheng <shengwen1997.tw@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Shengwen Cheng <shengwen1997.tw@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: riscv: PMU: Bound counter mask scan to BITS_PER_LONG
Date: Fri, 26 Jun 2026 13:40:51 +0800
Message-ID: <20260626054051.3360865-1-shengwen1997.tw@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_224121_319812_49BEBF5C 
X-CRM114-Status: UNSURE (   9.95  )
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

The PMU SBI handler passes the guest argument registers directly to the
PMU start/stop helpers:

kvm_riscv_vcpu_pmu_ctr_start(vcpu, cp->a0, cp->a1, cp->a2, ...)
kvm_riscv_vcpu_pmu_ctr_stop(vcpu, cp->a0, cp->a1, cp->a2, ...)

which map to:

unsigned long ctr_base
unsigned long ctr_mask
unsigned long flags

Thus cp->a1 is a single unsigned long ctr_mask, not a bitmap array sized
for RISCV_MAX_COUNTERS.

On RV32, RISCV_MAX_COUNTERS is 64 while BITS_PER_LONG is 32.  Using
for_each_set_bit() with RISCV_MAX_COUNTERS can therefore make
find_next_bit() access bits beyond the storage of ctr_mask on RV32.

Limit the scan to BITS_PER_LONG.  The requested counter range is already
validated by kvm_pmu_validate_counter_mask(), so this preserves RV64
behavior and avoids an out-of-bounds bitmap read on RV32.

Signed-off-by: Shengwen Cheng <shengwen1997.tw@gmail.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index bb46dcbfb..2025b6649 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -586,7 +586,7 @@ int kvm_riscv_vcpu_pmu_ctr_start(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 		}
 	}
 	/* Start the counters that have been configured and requested by the guest */
-	for_each_set_bit(i, &ctr_mask, RISCV_MAX_COUNTERS) {
+	for_each_set_bit(i, &ctr_mask, BITS_PER_LONG) {
 		pmc_index = array_index_nospec(i + ctr_base,
 					       RISCV_KVM_MAX_COUNTERS);
 		if (!test_bit(pmc_index, kvpmu->pmc_in_use))
@@ -658,7 +658,7 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 	}
 
 	/* Stop the counters that have been configured and requested by the guest */
-	for_each_set_bit(i, &ctr_mask, RISCV_MAX_COUNTERS) {
+	for_each_set_bit(i, &ctr_mask, BITS_PER_LONG) {
 		pmc_index = array_index_nospec(i + ctr_base,
 					       RISCV_KVM_MAX_COUNTERS);
 		if (!test_bit(pmc_index, kvpmu->pmc_in_use))
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
