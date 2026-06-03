Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A02DCD6E5D
	for <kvm-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 23:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bj0IASm8kBK4hceZUtmh33GrxLig1cvz9RnNkqLgrxs=; b=Tpsla9TgoUdXnn
	QbD5J1VcsrXJkbkDSY4nR9PLCeP0JV1d86TK+pB80FlVUWtXIrVKCFklsBe0xJHk2oVhufks5yBzN
	zKcI+pr9qEceEQmKN5Iz0lVIIFUHY5ilNEeu/NOsJtIjRSRMExFgSFeLrKj6WNkGG3oE8jOo2YLU4
	5c9Yp5FlKHSvCZkYiII3A+3b3cnarlCLE78lMadoWhZHjBbVssc4MiQa9MxYfIkdl80fqC7doljp0
	4quGva0VOb1v3784vnEgLl+6cPjKTL6wsPIJzI19wSvAj6rPXxPb8O5R3Hj9sgtHAAj/vB9DwtBow
	k1PwcpsUNBlBZeti1zvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUYL3-0000000Dwgf-3ECP;
	Tue, 02 Jun 2026 23:16:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUYL2-0000000Dwfi-02Zc
	for kvm-riscv@bombadil.infradead.org;
	Tue, 02 Jun 2026 23:16:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=elAeolCTc2IAaRv5GDeM52BjkVLUXqNe1DIyzckEuoM=; b=DuqaVLUy4XASouAtSrJGsXiqFE
	GWvndgqOaOt0ZFf1rEv3CWLqdK3fmtS7w9Ja+tFckrQUrBbEKo6teCFi0D5CL89akH6JlsVxWXE6I
	CcZR1EGlOfBac0MXjiRaPNeVqPDXDNwxdnWpzZVWSYp0DQenoPhZUFXuNaPT/+4SOma405o6WAzlY
	ESfxTwxhsXdCjk88cOFndzTk6IXDv3dwQ4j89f9O/oc+Ye+SM3S9LK1AwWMUTu/wFNZRmrTprmIr1
	YOwsVoAr1jnwS356b1M4QBUYxLAm3NBjBCk5YSalr9M3z8v6XTZ4xXuRvdXwcshfHsOJefrBoj5na
	XxWnV8EQ==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUYKe-0000000Afy3-1OYq
	for kvm-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 23:15:57 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso30240225ad.0
        for <kvm-riscv@lists.infradead.org>; Tue, 02 Jun 2026 16:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780442131; x=1781046931; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=elAeolCTc2IAaRv5GDeM52BjkVLUXqNe1DIyzckEuoM=;
        b=TLIYRA8TaDYKf8N2ZLQV+0mOBKFNlaVyiE+yJkleROCNfcsLfFp+YDiPJCe/BCORga
         gC4L+YVYKg9MGpZEAgjO/jZzE1UwYurXn2SdyNTRllsRFcULqQrEQg5kNufN2355eL7V
         XrMt+eswt4cP2xn07Ihcv9lmVpoHxPQK9pNcYtz9zONncT/2ZMVDIQe21fJU6SnDHU8e
         0v30DniFzfkQRlPkhOrjxagIRZkZab52zQbwR8W9JRGgiHNFKRgxHyZcSmiBoICfMwMc
         P6n/0xoLWsmpAKPHAE83da9uluGDME/8VwKbY8QB+PRtetThCPcCWdEXEvhM+TNVLJFn
         l9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780442131; x=1781046931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=elAeolCTc2IAaRv5GDeM52BjkVLUXqNe1DIyzckEuoM=;
        b=ONW7Ma/EP1zKgR7JVTizDSeWKLY/ITjxJx/p2BybgQWGFcI86L1lhv46fTuKSjl53c
         CbDVj9U0QsXovNpp0ZSluLL4OD+TWGEHsEuQZf48wyypJTKwdB6cjSOB1dqbsWsH2PA9
         DUTT7/CQfndrjMAk9VNs5Lb5WI0Jn2qe/n6RKyrcNZqNobVsEpNHKSl5W3QZyZiRgGwG
         rTPGwlizU01Ct25SLJAlVtp8qpPujvhvk8AjsvgtGuNF8EH2G+vBNX8Fg+3PQzBXt7VW
         jQ+WqcNoMbc10ONBBaeyBWQJTTNMREhjJpMgdCBxpy57WkOHKL4FDvQQBoU/Ns9lZHLP
         wyqw==
X-Forwarded-Encrypted: i=1; AFNElJ/StGAk+O3105UE9ArO/eSOOyayZ9s1CL48bOFY7Tmp+MnKscZZnN4ziRIszYQdFEmHTmQP3Y5T75s=@lists.infradead.org
X-Gm-Message-State: AOJu0YxCQahLAGFp7WcsSO7W5bkjsCkjeprN9XtqCw+kfGekWtGS5paP
	Z0p/hI+Q1YPGVbEJrAOMGgWNde4QE2vNXk5ztRXLNmtmwfEWJQ3Z/glW
X-Gm-Gg: Acq92OFpR+P01FLwvx/JNwuK+xdaTLNMNir5/CnR4s+ar8Kn+o68vCxUgy71tzOryxW
	vaPIF6FAtNSNXIV1n588euuT7KvFYp/vXe3VjVXRdin0XN4x5AxtxifdOPkrs4i6AAaoABQ/+Fh
	CzWcPRHmM/OqM5EHojyd3LD9Ev4sR8+nslQr/alRPLi9a534bztBX486TbpSHrwSzaEznXXV5oY
	CDWV85no4fRV0hi+tH2kX4M6pgW7wvIYwxGnphQzEMpbyxuiV6/YjwI/a1Eij64rXtJlvazqVs5
	T0VkNpv6z8Oj1HxIQzrIzG95eYD4If7c+8CCL21YLb0oXvqK+wU3VjScxLwjxiu0DeNr4/ivo4s
	UNh1o+ChNhVny61MpPMONrgq3oktfSqH9Kxf4SRtBtA1nECKnregs98+y+ZQtwoju2gQGy2kPvv
	Tsg9uDA9eC4w==
X-Received: by 2002:a17:902:f547:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2c163a3d1b6mr7203385ad.9.1780442131511;
        Tue, 02 Jun 2026 16:15:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649d2dfsm3302965ad.75.2026.06.02.16.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 16:15:31 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 03 Jun 2026 07:12:10 -0400
Subject: [PATCH v3 15/15] riscv: hwprobe: Introduce rva23u64 base behavior
MIME-Version: 1.0
Message-Id: <20260603-rva23u64-hwprobe-v2-v3-15-5529a7b28384@gmail.com>
References: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
In-Reply-To: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Shuah Khan <shuah@kernel.org>, 
 Christian Brauner <brauner@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charles Jenkins <thecharlesjenkins@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4827; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=O+m6esE1h2WCRNa4TSXJ8l0GsbEGYg/n4liKpqmrez8=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiwFHvYP001VTd0EX7Jtz/r1fX1MpPDfafPEZD+aHd25Y
 k/yjFD7jlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZiIdQkjQ8cd3dI3NxoXfthj
 fUXAwaAgPdVj8ZIbF5tKmY5ZCLtMvsfIsIYrRmnaLyfmpTIiSa2u0svvnnrlZeYgUrt9jafMDDt
 1HgA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_001551_653127_F27B9261 
X-CRM114-Status: GOOD (  16.25  )
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
index 601e81f561421..d6712259946e9 100644
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
