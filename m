Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BDAC43458
	for <kvm-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 12:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tqGLXWOdt8rNC4rUReE0WJtE7ckI8sRxW0UC8Y1+fUI=; b=l7V1lyjm6Jhf+K
	+7RjctB8QzZo0hejkPgbMR/bEAplQxLl90RWF6vrB2OussqjBB8t8WX/ABYC/t4cbV82RFzc3HEk4
	Ng2SEum2+QXDkhmVUKrZKbM8I8KYfdSr19KD/Tuu5mKFoixUQpl4n+cPMDVcL4LWvn1qn2dvpiCe+
	yTD/GxU5eq135vEEwdjnfUqt/Kd/ITRtP3zJUTPewRSNg4hPZMOY8I6zqbq6kQRKRiNY5Ife5xjqW
	umF6Ys/aPjSAh7UwOz2ermjurNCDvAP1lT/D+PA2hbzA1nvwDf2T4V0QCyGWo2PDjAUku+EaeyjXf
	h/pnc9LkCLvPpsw3+/ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuTY-000000024sV-3mua;
	Wed, 01 Jul 2026 12:55:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuTU-000000024pu-3l7P
	for kvm-riscv@bombadil.infradead.org;
	Wed, 01 Jul 2026 12:55:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0UYpoyK5fl+7ujxdLva1zphzrbPXeYkLwxH26RQow7w=; b=l58neZ3uVcj2d9eaUWOaZSaVyK
	baGrIII0l2dgolJq1nHQto8lurZuPn11782ExasjzKeoADmov7A9RtHiFeWLP8j1I6tzFxo5/2J6R
	+Rk4u0HaoXvMFtjUmEu/PMZvFUK0MA5muKddwI2zdUyFR6wWdzalm+rgPJJ47wvtztRGLPTMaoMX7
	+wYSnlSOiE8cl6njzHDffnhWZaxNapk6kkyPF6WUv8t3/YBGZk1nPC2NlA3RhcqVKShl3pj//bRj8
	Wooxai5ib22TTbDfxr+cR4//XH+yQghr6gRHBT08vCmM+w3ui3dhCvYvA+Lt2T0wyuizPRwVNfE+r
	q0yyP/zA==;
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weuTQ-00000002mqb-2eTv
	for kvm-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 12:55:31 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-84783bce476so508576b3a.0
        for <kvm-riscv@lists.infradead.org>; Wed, 01 Jul 2026 05:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910527; x=1783515327; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0UYpoyK5fl+7ujxdLva1zphzrbPXeYkLwxH26RQow7w=;
        b=RvMD1HAfJ3mc3BuvujNVuRAWM6sAuqy0XkS9nYhBWoXf6WlG1Jfin9c9OqaodSxH8O
         KT43ncnbFgtofw56ADG15PU7MecIU1pQSnorMOesq06rDVOD81eA2txAxEdP6J8z3kSX
         f93gf90zSZaqBaw5S3J4iSl3xOtV31Tw2bV2cMTv03Mc0ACk2hkSv6zTW4IkQ2Vm8ioZ
         USCW9cVHvikMJMSH7YQ9tKwJamr7X00+fU9MxvX+KO2JtCSgFetqy3nJ789ELzfUZuMo
         FzQTkOUGDDyAeCC7SdHnsYciILt5B+bcPjXi1snmb6DHp6fbYWZwd9D8MlQ/OqlrwpnR
         p+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910527; x=1783515327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0UYpoyK5fl+7ujxdLva1zphzrbPXeYkLwxH26RQow7w=;
        b=ZnY96FyBLhKwqsG77NtIcgqrtE0LJeymeICTBMSIvPGWOBnAwep1+yWnvdeF09Dq1p
         hfk5zbAb+NYYxoAr2unNWudn2UUdCDMSI2ULKG1cjD3nJD6GKi39jdJkz+qmkKvuKmf0
         efWt9pjA6rQtuMRiL2snmFblLjaKlCwd1pFY4g/6IZIDRW0UGua7Dhy1d42pnq0XKSfr
         3z9jKYvYKlk5EWV0HlS/FjNw0mktG4H9Xd8+FO4rgQDsxTb86J48JbJXFbLEXfY/eGcx
         wwsRW1yUzI1ftKAWL1cNrX/TBHk+zJZsSl107n0DxcUw4olPzeij3z59rWC4sDIjfJjj
         i+pQ==
X-Forwarded-Encrypted: i=1; AHgh+RoYogyyzkVNOeJM916f4ULWOYCKKK0HWpb/waIrACkueoBtFHxqSJCEWmmp6bdIbVf3LS2KngcmNqY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwGOty9nqJ3xEm4gzYaWur9XH9B5qnI//Mj08KPPV50xVkQ38Wp
	SANKfuUhGHYqCDaD/qE7h8YZ2Lv8qL/+tBox6sTz7rK6nPSuDDigRauL
X-Gm-Gg: AfdE7cmJrX5qyjM25qTy64dehE45eM20+n8mc+mczZlcpjvvk7Nl77T8o1M+erI6vKM
	f8kA6pDVVmGvlWcQ82pXo4MG8Uyo5fXvzvMgbhbB9Z8fKXKKELKEm/Gq//VOm2MuN/Rq6heI2Bn
	/y6QbQkRz3Mb7gP5HmRLOQCHzcJUb5VPbNKZUXFGSVub5mqNtMLpz5c3ubOrYx6Kw9EB4BAPsEj
	ATcRfnb4O+aDP7i8K2Sj15BWz/M5INkc2rXygbcXmhR8nEaVlGsan/33kR75a2R70jMEj3MhcxY
	28sqa3etmo/vqWVJ0txd3F+9qTqbQ8/QYpsUrpLp6/OdeFnSyTYHATArGKmhqBiOFKfEL9TVjH1
	tMvwY0yuTIGlX1EDQl7FuIfr9Hi4qElDTINR5rIbS3ZX/tP2vKD6svK6e8vla2zskEgvMPnlUzi
	o0Qdr0HmudimtvdRHkpsJD
X-Received: by 2002:a05:6a00:8d0:b0:847:83bd:6676 with SMTP id d2e1a72fcca58-847c0797314mr1543138b3a.17.1782910526573;
        Wed, 01 Jul 2026 05:55:26 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:55:26 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 01 Jul 2026 08:52:30 -0400
Subject: [PATCH v5 17/17] riscv: hwprobe: Introduce rva23u64 base behavior
MIME-Version: 1.0
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-17-2c61f94a695a@gmail.com>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Chen Wang <chen.wang@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Jesse Taube <jtaubepe@redhat.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4859; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=JS2yG9pDjGwh3KA79+kpc5rS+oVEF7mlXGQkOFvbxFc=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3vaDBvML16z7O4dpxQF11qYlJadmHrDpqhEv/rXBV
 9tr7sX4jlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZiI4i6G//W2Nn4L07wviPnP
 LdUK7wr5wKn66Jh0oNmqaTU/WmetLGNkuBHhnqF5wDSfY9vegt8vfd7POrRq0kY2Y3mJhecqlh3
 h4gEA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_135528_785329_A1C2B411 
X-CRM114-Status: GOOD (  16.67  )
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
v5: No change.
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
