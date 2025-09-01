Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F22CA0FFD
	for <kvm-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 08:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gACMdKp6V8JHBPFKbon5JX+QfXFxBnDIGB1I7VT2WHk=; b=wvt0aIhS8pQMpa
	HH2c7/MTLCMRLaYk1XP3Sc2CCcsIEmZSlzAkZI3w6uzmS8ybWIAziuvmOGq7hh9V9/Ah3Ht+zFuGN
	ice7rR4tvIo/vrjoUpj/euN+IbRba8rz6i5CGDHiHdU7LkjvzwzbaTSmnqGBtai+IcB/wctsbTiLm
	0iXKZTXcB5ET8brFyjNrMPY2arePFLyaorMYl5zYodYaMoKEkzgnlzMQIJ3EyY9ltKjoAAUxfxINn
	w+nNa07hLf2MZbQjn0ysbdEeg6EcvpIPnQgjBoDxdxcuVOsXtWibjZaf4zEy/hrKSPD40cXUj3Lsi
	Fj4a/VTfMRHqjDSh8URw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uszU5-0000000BVz1-3UmS;
	Mon, 01 Sep 2025 08:01:49 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usz5L-0000000BSKK-2lkC;
	Mon, 01 Sep 2025 07:36:16 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-249036375a1so26661525ad.2;
        Mon, 01 Sep 2025 00:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756712175; x=1757316975; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5oeHOkgW1SXEWkLO09M8aNICfxiWEQZMbiFzd9nXhNI=;
        b=FIw7pgIjYEScCwzl3fRc/WhwMUWw0g/93vBrAOuyyMnBjeOVv8TgwPCLMfYKTatqdb
         wf6sTsjRgTQGAmgRUPs18WWpwWXvpySdtndcl+u1wrZf/0ZU8GBpV+J38bx3CWdQM4EM
         tVxTgge5J8/3NloEbDQ5hsUvlU5zOoy9Ws0zBPB6bnnHapPwv7yZGO5DiAmIrzB9Wee1
         eN1felaaS9/R/GeuxUquSZhfcWICWDlB7Htc2fpAyAmrYLfEBdKA80lhEWPCJVdUjGxh
         9BC2bwi56EeIYguYfGFMEZyU4SKzcDf7HLhiHghINcwz+4CcoqCsap2CpiFsqfG8H2+N
         nSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756712175; x=1757316975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5oeHOkgW1SXEWkLO09M8aNICfxiWEQZMbiFzd9nXhNI=;
        b=SirONz59V/3tN75MCikcnq5ykqg7A90UoggJk8yMJqeXj66bKd+l6vRKrNw8YDaVWb
         quG2AjZCkpY8yNPZTwMGHHq/LdDB3JeBT/gzm3E8PkKsA1Zt5OAiO3LOwHw9Q2iYP/UR
         zglxHT8XbDKNjgu+29e9l5oWJi6hGviBcOQRbMDJcw2zwU2mXs3pWz5EiwG82xsa6HhI
         Dx6DsG2DeGkf/KxaHclSZGduz430uuKsvUAEtOwM6O60lo+l/emawGzQWhuyM4TWD00i
         n4a3/EgKt8nnU/CoXo6uT/CNkf8dugCegRcf2rFzsuqpykNUgBCY6F+JgHPlGSuKhvU6
         XH+A==
X-Forwarded-Encrypted: i=1; AJvYcCU3yEcoYAcX30Gil+bXGqS1Y4CmVFRUKJl0RzapW6y8XXck8pRZ/QDX0Q5SJMwl3Bat7UaGfB/CY24=@lists.infradead.org, AJvYcCUYcwtbg6KGIy0/UVzN7hCuRr2ln/zpyylA/o7uaFvAbeBbjTAxOS64ck8eOpSQRBA9qMtbNk+kpm+a/BI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyLROe3dbMB6VROJfCJJdzBM50w+lLMgqZvsWuYQeq6BgTMNVMv
	xOGOMgga/DgS9tVbaBww/lzbi1PnpXmFdbffNf1PZlZza1GYlJHm1Dsk
X-Gm-Gg: ASbGncsSEHlZ6jZKs//Lt3Dpi5CHZxdqWWeNqHC8nEhp/oAAyo9ZwzxcTZ2AakEwJcZ
	lHHtxxPx6Ikgcdr1fW6DpWriE8siYKskcCxxpWhpJZ/03oJfphqrnp5arPScGPhTN7WdAdWcjtL
	sMpQuZOIwHfhiq1h/zxNkO/rLYPyonFBzXKWbmKaDNHes1vIDiKQZYZr88eIzgDvOJOLnz8APaP
	mFe3VmzBq0vdcQsyo10AQiqDCqwpXLn08Dpp1sNq47ce8hvgNMjLTsni00HIogh4UJDnKBDZlwM
	4VHblu3ZmMVuq3FKmIk9Iw6U03JCCuzYk04UPQNGBMYIsBsH7c+BZ8aYf1l7GfDI31P9tZ5Ya+4
	IBu0AJ5dl0LZNxdMFiVdw
X-Google-Smtp-Source: AGHT+IEmw91k51+a/u/6Yg/p/QfXcjorBAKjeKm8LC1Ywv4G99JsY2MawriOAwBq5epZ8HFlkc1KVw==
X-Received: by 2002:a17:902:ccd1:b0:246:de32:10d2 with SMTP id d9443c01a7336-24944a458c3mr90279695ad.15.1756712174848;
        Mon, 01 Sep 2025 00:36:14 -0700 (PDT)
Received: from days-ASUSLaptop.lan ([2406:8dc0:6008:46::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903737b05sm95867045ad.49.2025.09.01.00.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 00:36:14 -0700 (PDT)
From: dayss1224@gmail.com
To: pbonzini@redhat.com,
	shuah@kernel.org,
	anup@brainfault.org
Cc: atish.patra@linux.dev,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Dong Yang <dayss1224@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v3 2/3] KVM: riscv: selftests: Add missing headers for new testcases
Date: Mon,  1 Sep 2025 15:35:50 +0800
Message-Id: <bfb66541918de68cd89b83bc3430af94bdc75a85.1756710918.git.dayss1224@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1756710918.git.dayss1224@gmail.com>
References: <cover.1756710918.git.dayss1224@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_003615_698873_73F1F59F 
X-CRM114-Status: UNSURE (   9.47  )
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

From: Dong Yang <dayss1224@gmail.com>

Add missing headers to fix the build for new RISC-V KVM selftests.

Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Dong Yang <dayss1224@gmail.com>
---
 tools/testing/selftests/kvm/access_tracking_perf_test.c        | 1 +
 tools/testing/selftests/kvm/include/riscv/processor.h          | 1 +
 tools/testing/selftests/kvm/memslot_modification_stress_test.c | 1 +
 tools/testing/selftests/kvm/memslot_perf_test.c                | 1 +
 4 files changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/access_tracking_perf_test.c b/tools/testing/selftests/kvm/access_tracking_perf_test.c
index c9de66537ec3..b058f27b2141 100644
--- a/tools/testing/selftests/kvm/access_tracking_perf_test.c
+++ b/tools/testing/selftests/kvm/access_tracking_perf_test.c
@@ -50,6 +50,7 @@
 #include "memstress.h"
 #include "guest_modes.h"
 #include "processor.h"
+#include "ucall_common.h"
 
 #include "cgroup_util.h"
 #include "lru_gen_util.h"
diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index 162f303d9daa..e58282488beb 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -9,6 +9,7 @@
 
 #include <linux/stringify.h>
 #include <asm/csr.h>
+#include <asm/vdso/processor.h>
 #include "kvm_util.h"
 
 #define INSN_OPCODE_MASK	0x007c
diff --git a/tools/testing/selftests/kvm/memslot_modification_stress_test.c b/tools/testing/selftests/kvm/memslot_modification_stress_test.c
index c81a84990eab..3cdfa3b19b85 100644
--- a/tools/testing/selftests/kvm/memslot_modification_stress_test.c
+++ b/tools/testing/selftests/kvm/memslot_modification_stress_test.c
@@ -22,6 +22,7 @@
 #include "processor.h"
 #include "test_util.h"
 #include "guest_modes.h"
+#include "ucall_common.h"
 
 #define DUMMY_MEMSLOT_INDEX 7
 
diff --git a/tools/testing/selftests/kvm/memslot_perf_test.c b/tools/testing/selftests/kvm/memslot_perf_test.c
index e3711beff7f3..5087d082c4b0 100644
--- a/tools/testing/selftests/kvm/memslot_perf_test.c
+++ b/tools/testing/selftests/kvm/memslot_perf_test.c
@@ -25,6 +25,7 @@
 #include <test_util.h>
 #include <kvm_util.h>
 #include <processor.h>
+#include <ucall_common.h>
 
 #define MEM_EXTRA_SIZE		SZ_64K
 
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
