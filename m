Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FCFCD98C7
	for <kvm-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 20:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJagtWsmgnwDLJtK6YinZE26fzTAXS5IQnY9W+/Gil8=; b=0eRCRditns14sk
	jZ9LjNtfZERZXizJGsTNmgkwsGnoKlTWAX5/CqbxFXuQy0lKOQJZntdFZKqj2HZTctZgbFFaCsWb5
	/8fJ4sO0CheUBGkhrg0Kk3nQn0SHcnKLOsWx0t7W2Lr0ma4So8aZEVfO91yW+Y0DakIaljyU/t08x
	eHverXdEdvSBdprTdxcWQcUurzYOLut5sRfFi7m/gyNZ8tVKX90YMAiHBgk6YFN5sO2NUgioGtema
	2qpKv0SF42g2t7cRyRyOTJOP3EXAFFg4Oicum4faMN+Qi3aY17gu9lM/Pe/LLez1k7E1am9JKjmal
	b4RHvUXb5FJiC04mbnKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXloF-0000000A1mG-2Gsg;
	Thu, 11 Jun 2026 20:15:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXloD-0000000A1kk-33By
	for kvm-riscv@bombadil.infradead.org;
	Thu, 11 Jun 2026 20:15:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=SXkT6PmbtXC0d/wtet81Vb0IYNXQoXYAymVUyoGXQ78=; b=dxPnAsREjj0toN+aTOb5fcV77o
	CSNetaV8DJkdbp4ukGHPrqJFnnIHMTQzXG3xSDkrBmFIOVPNzwyjjMAIUYeIqr1iIf0fx3ZYAQqMQ
	q4UeEvuQN8igCh0ebDPjAComWLW26htv0X5LvZwPOC98iI73TQ1d64C5sbB8qHd0EaJ0xIDIDpEdF
	uS7j0XL6Di1WPicqUZ83AkbvOdfXwS8Zyp/oiYHV0TTMVe1W9abU8zjoe/e4LNDJeafrdP328LMfj
	4lPYKl3qg4YwI/bpXWr3Fb2xz2/VdS3k0Xu5ggNDfVjQNOI5ZIIJLOlcB0arqClQUoPr39BbP9yTs
	Ocf0fP6g==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlo9-00000002Wm7-34of
	for kvm-riscv@lists.infradead.org;
	Thu, 11 Jun 2026 20:15:24 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2bf30d530bdso2556995ad.3
        for <kvm-riscv@lists.infradead.org>; Thu, 11 Jun 2026 13:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208919; x=1781813719; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXkT6PmbtXC0d/wtet81Vb0IYNXQoXYAymVUyoGXQ78=;
        b=Fe1gLptxB76N/HKr860v2Ylg1pzzMVJZoGLCNbA2xh7Ymhp0LFJBVN01LroTiF+4dz
         uJl0rmXXosfMPu7s5vFJp6fJWg3FWA0c5syaW6j/hl8IRIupf8w2+ih86CIUxxO5GQ3y
         7WoEAVm1npupX/E1G2N5QJQNJSZNIPKJIPZxI49n4VqaeAF4C+fnDLlM0DGSjMCuy64B
         fgzDP2OizthV1JFkKPFiHzKpQTwH2ChrF2lU8LYxgrxhg9n5yKdsDjqtc9jwddC5TjR9
         0zCNVczvGtDhogYSMq2fVooKzljcrkWRGnAKe7RqW/PbYjy7sFo2O8iwV0PtHnUYtloZ
         UyNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208919; x=1781813719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SXkT6PmbtXC0d/wtet81Vb0IYNXQoXYAymVUyoGXQ78=;
        b=MoK+BzjJCoFCdyy/coEIUP+rjI9KuVKdMOIqDvDYHYUGm+8F4hWuxQC/oVtzVq81JG
         z3YJru+fL1ckvYA5nek1goNQFPmUDL4OFIdJEgO0vatQWOO0uFHWU4Oa2Oritp2RUfIX
         LovPILfTZSHF4id07Tn0BTbd1mO1GUqgqJbJyFcWnbInLmqYRjgGlWFKtCWr+k/L7VWD
         xzpIN7JMmpV1iEadAWhS0Uz9Cop+NcWX5647nYo+WJl5rLLys7cv4BhJo/J8JheAssl9
         lXB5lQcJ7RB3ELalkvo1RJFqoQEPu/TJaTDsRJBqWRhvKDvDFw9luQ6FyvspxQYAVWMP
         28Pg==
X-Forwarded-Encrypted: i=1; AFNElJ8QCjUh2/Z/ctzil6yQzS519H9SrncXo0lJD3PCbRHD0lntyPrYgJeHC7Qvn9r1/yq3myocOfSEa7s=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyhf45pwkuDtvvEHcJQ6Y7dviKu0C4K0MrdZ9sY8S7f2h4wa6ho
	mw85vcHEr7IW6BGXL7C/eSZXfzUnv9hZETYwwpeNH+CXJqqw7IB9q1ff
X-Gm-Gg: Acq92OHhgipsAHpgv/ghu9UPnJOXEjAnNRr5BF2grj0zuHDynz9Ueow12MG/UkEZal+
	QvKMV63gQFVJ8dp3q3c2xUlmQiIAoEWuwnw2En1XbIW/kicyDo6QrjncSgoaqsDRLMwwD1e5AQt
	rp8uhUBOMXKJ0ct4NpJYVwvqz3mIvVYX1WMdnCAeY7DH5JN4AjUs2rSeL6Ne87o1buh568/rt/W
	66DiZVzNwWux0+TCZgvWP0RN6SWRDx3E6ylLVnOJuNVwJVKVc3oM/Yo67YGRV6daZ777JYqp/mI
	aw4X8Jw5y2yvdEJQutH2bH/OQQPdJD9as6KM7+aTUeKpQzQhK7vRJPjkNUi+SKmB9cAWNioxynq
	qBN2lsLGnvlew1BQevo5DSAHSLioFceLPYIMLPdSTK1FvotHN3gZmE3cEC/K4kF52N3vnePIVmQ
	==
X-Received: by 2002:a17:903:41cf:b0:2b4:656b:aeb0 with SMTP id d9443c01a7336-2c2f4fd8bbemr50216465ad.35.1781208919538;
        Thu, 11 Jun 2026 13:15:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm288730475ad.22.2026.06.11.13.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:15:19 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 11 Jun 2026 16:12:53 -0400
Subject: [PATCH v4 16/16] riscv: hwprobe: Introduce rva23u64 base behavior
MIME-Version: 1.0
Message-Id: <20260611-rva23u64-hwprobe-v2-v4-16-3f01a2449488@gmail.com>
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4843; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=ztCzluR5K1LOfYvJO2M/7Jb0AjscEHQ8dyRN17VY1U0=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixtsSM//PujPG/o5C1988NFUFrlz3OZHb+sFHZukhbJ4
 gmQWDGzo5SFQYyLQVZMkeXw0Zbsra98on2fc/6AmcPKBDKEgYtTACZyvoWR4Yvq2kdr86/OeP4u
 qMp8S+LZV3N353cxPzBS0t6YmX07+h0jw50MkaNquufeZAvdUuY5IyOsvCP6GE9UwXfZPrNulv3
 drAA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_211522_704206_C7F2D0E5 
X-CRM114-Status: GOOD (  13.31  )
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

Provide a hwprobe base-behavior bit so userspace can check RVA23U64
support in one call.  Without it, a consumer needs five hwprobe
calls and four prctl calls, which is error-prone to require of every
caller.  Most software treats RVA23U64 as a new base anyway, so
expose it directly.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v4: No change.
v3: No change.
v2:
- Detect RVA23U64 by reading from the cached hart_isa[].isa_bases
  bitmap populated by riscv_init_isa_bases() at init time, sharing
  one source of truth with /proc/cpuinfo.
---
 Documentation/arch/riscv/hwprobe.rst               |  8 ++++++++
 arch/riscv/include/uapi/asm/hwprobe.h              |  3 ++-
 arch/riscv/kernel/sys_hwprobe.c                    | 23 +++++++++++++++-------
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |  2 +-
 4 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 32a14331eb9de..dc70470093b1b 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -67,6 +67,14 @@ The following keys are defined:
       programs (it may still be executed in userspace via a
       kernel-controlled mechanism such as the vDSO).
 
+  * :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64`: Support for all mandatory
+    extensions of RVA23U64, as defined in the RISC-V Profiles specification
+    starting from commit 0273f3c921b6 ("rva23/rvb23 ratified").
+
+    The RVA23U64 base is based upon the IMA base and therefore IMA extension
+    keys (e.g. :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`:) may be used to probe
+    optional extensions.
+
 * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0`: A bitmask containing extensions
   that are compatible with the :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`:
   base system behavior.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 36ec8ab470423..50733d3db7633 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -21,7 +21,8 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_MARCHID	1
 #define RISCV_HWPROBE_KEY_MIMPID	2
 #define RISCV_HWPROBE_KEY_BASE_BEHAVIOR	3
-#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA	(1 << 0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_IMA		(1 << 0)
+#define		RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64	(1 << 1)
 #define RISCV_HWPROBE_KEY_IMA_EXT_0	4
 #define		RISCV_HWPROBE_IMA_FD		(1 << 0)
 #define		RISCV_HWPROBE_IMA_C		(1 << 1)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 3e80e5551ae0d..3f66f2e99d41a 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -226,6 +226,17 @@ static bool hwprobe_ext0_has(const struct cpumask *cpus, u64 ext)
 	return (pair.value & ext);
 }
 
+static bool hwprobe_has_isa_base(const struct cpumask *cpus, unsigned int base)
+{
+	int cpu;
+
+	for_each_cpu(cpu, cpus) {
+		if (!test_bit(base, hart_isa[cpu].isa_bases))
+			return false;
+	}
+	return true;
+}
+
 #if defined(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)
 static u64 hwprobe_misaligned(const struct cpumask *cpus)
 {
@@ -308,14 +319,12 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 	case RISCV_HWPROBE_KEY_MIMPID:
 		hwprobe_arch_id(pair, cpus);
 		break;
-	/*
-	 * The kernel already assumes that the base single-letter ISA
-	 * extensions are supported on all harts, and only supports the
-	 * IMA base, so just cheat a bit here and tell that to
-	 * userspace.
-	 */
 	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
-		pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		pair->value = 0;
+		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_IMA))
+			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
+		if (hwprobe_has_isa_base(cpus, RISCV_ISA_BASE_RVA23U64))
+			pair->value |= RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64;
 		break;
 
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:
diff --git a/tools/testing/selftests/riscv/hwprobe/which-cpus.c b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
index 587feb198c049..f8c797b1d0fd9 100644
--- a/tools/testing/selftests/riscv/hwprobe/which-cpus.c
+++ b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
@@ -105,7 +105,7 @@ int main(int argc, char **argv)
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, };
 	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);
 	assert(rc == 0 && pairs[0].key == RISCV_HWPROBE_KEY_BASE_BEHAVIOR &&
-	       pairs[0].value == RISCV_HWPROBE_BASE_BEHAVIOR_IMA);
+	       (pairs[0].value & RISCV_HWPROBE_BASE_BEHAVIOR_IMA));
 
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, };
 	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
