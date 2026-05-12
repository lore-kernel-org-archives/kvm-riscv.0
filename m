Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2A0CD484C
	for <kvm-riscv@archiver.kernel.org>; Mon, 11 May 2026 13:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lT4aK45oEKpHj5MCZ8oMyLakqwMNZt8MiwlMfSnZ7Ec=; b=x1lJXnvNw5sTRE
	Y0Fw7+2PzxeLn9Pa++triCFDyyz+L3U3yuCPSeuJRWOOBlyLBcNyeTcJUSe87ASGWFaCv+AheK7zT
	e6Lv4bbr3BEjtbjkAqE+bMdmdtXAfDd3vwnUwePOhbZiXwzaa4qh+rkUxkjp0ufgunOF/kCLNwbuy
	7h05ifQOsEE9uPWLWA+umitfJ5eEkxl0cVB90i3KsMQpHtp9naVfOvSYZHInVvApVccW2mY6EJ6Nl
	GBp+YnPnRn7lyeIdmPg5ojt5eu6evLqE9EhZy6Sf27c739Jbb28XaIzE9GngusjQfMDn0eb9fT8Il
	tAcFa1Fv08zFrTpk/QyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQpT-0000000DmPS-0zMA;
	Mon, 11 May 2026 13:37:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQpI-0000000DmJR-0c5b
	for kvm-riscv@bombadil.infradead.org;
	Mon, 11 May 2026 13:37:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9bIv5E7CDUy/32Snb6v5lvrwzzQuIONo/kTKOPolOf4=; b=i468HwUj1rRgYvQvoP1+wPwEQv
	MJn5iZRaDvVQ+AR/yvwi3sCDc6mH+VE5OSUSP1QIoaYECLIsp91/RqxY0Lkhl1Uvk1i3Z0VwWWH5w
	az+8TxVfr77GDqArx4TSfRSAQIkghbFm0TQLw/z74I5gta8SIRAI7ZWSMyBpZbX2mAZlE6lkhCTc7
	PNydN2097NMxkN1aiWCzBUALkoqyz5rAnyJNfbXW43lO5BCtVMWq9ziN9RaAbQxQpaZNs2Ybg156R
	x98hGUzLajXoCr//olJW7u/rQLwUVPxuBnlk9w1EJOSBp3xkloaTjHfTLRkoPawx4Gtr6U5rD5Wpj
	u1gqUL4g==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQpE-0000000BouM-35Kw
	for kvm-riscv@lists.infradead.org;
	Mon, 11 May 2026 13:37:38 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-36523acb0c1so2957216a91.0
        for <kvm-riscv@lists.infradead.org>; Mon, 11 May 2026 06:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778506655; x=1779111455; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bIv5E7CDUy/32Snb6v5lvrwzzQuIONo/kTKOPolOf4=;
        b=L21B+BmKGl6P5WYqj31U0lXIQ2aTcUNTGUASnqOsYvZDeMOZrn9pTSeMcOEAKdHOjC
         95jFIIUQsjJkIM7SYIKvDKJGasmwfp3PXeaMPcvju+ROmpasTBeoPexEebE9Zr2zZA0v
         9UbmTFnaAk95/Og0Jq4IVAb+avVk72+t1kCcMty/zrtDFEBs69a5R4xeofPSWjicU/qt
         JDNeRoADAAbXGsgokttOENlfeN3fiun6qNgmwI3rNURzexqsfrNs6RAgcuAku46GpZm9
         MN/INfTOLyrjvZ+ANEIZkd6DUCivb0x/VN1TcchfRR5uG/0phJOXbTt3eGGANvONkVHY
         6Flg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778506655; x=1779111455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9bIv5E7CDUy/32Snb6v5lvrwzzQuIONo/kTKOPolOf4=;
        b=KWK5RRBTswYtpQstw/VD7w/58UAFUyJBRfoOoVnReJYWid2LWGY3gYlP2eRk3S5Dsk
         ufO1Ai3uetyuUIvHFg/P9vB9qpm+msZXlsJjKDuzi9Xud1SZJnQt86LsuWoFcpRvbyCo
         tiqT/jAqUOL7HCHuVhqlQ62rYs+/Q11aON7mJlgzrbl3wFGusiX9wVQOPQfflckce6hN
         WZ0yTPrZZJofV9hMTjDzT0BgvQ7vn7BnD5TW6LJgb4hJezP3fRJvIpWCLJPX9Li9UrPE
         mpFPBriOy2PizyudooxUc1q+5P5lKsot0Sy/JVTHEv7y+rWNGPWehPCpN05aIqNor1q1
         wHPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9AGqV4g+vXqKPKHKsAjJzBSZ6K7dWnsn9YoTlb1HJAbana9z7zR/N/xNW5RZtsbTpIqtlEeKYVq70=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywzepqnq4u2xHQ5/yDsW9LuVAL82CsDx5sKDE9J4b//oX7VSwTj
	tkkZIEyb2Cn0M90hPvKk1xWM6+dZa9PG48z37mkuCXg1yv95otBYNvSKR+yznmiSK8Y=
X-Gm-Gg: Acq92OG1qJG3XP+NErzajqTsqCCqKW/4R3bQKNoA81thO3pxoDf3y2XzSWcsFUudBaZ
	XyGIJifunCDAQuCpCmaZnA21lNWf57zoYQWt+AxRyutyIcMZ7xaG83I9+Kaz1yjKMsBzq0QcrGY
	rF4DmA2kbvvuBzXdtaM6aH9qIa/gfIuHyprGXTZ3S2kakAZmIXBmmwEZg9r66tV34AGN8sRbn6P
	6UfNMSmUZRQO9YmiOIAhjk87PCwA26Aw7av+5GIWKHMzGa0hJrLJGjXaa/3CllPipK2Nn4GKC+C
	yH1Yu4UXCMal1W+R3on1k0szEcb3zl+Koc4jw603uSsiB/gA+lnYET6OFnTpzK7peiYw7MRR/a2
	Ki2cfKqB+Wel+JmSzS115N9AyV55ir3a6aNsYBSkWsYRNaPe234eWcRSOSt79cHz6ioWw889r3b
	qaRgpNswfmu+HI7dkmYuSu33SmAtj0RTJFq8CdthovnXa6ZWCz8a/wgQ==
X-Received: by 2002:a17:90b:2750:b0:364:a173:2d61 with SMTP id 98e67ed59e1d1-365abcf240fmr23278068a91.11.1778506655158;
        Mon, 11 May 2026 06:37:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30f3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367be3daafesm3034326a91.8.2026.05.11.06.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:37:34 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 11 May 2026 21:34:55 -0400
Subject: [PATCH v2 10/10] riscv: hwprobe: Introduce rva23u64 base behavior
MIME-Version: 1.0
Message-Id: <20260511-rva23u64-hwprobe-v2-v2-10-21c5a544f1dc@riscstar.com>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
In-Reply-To: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
 Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_143737_356074_B9C72F6A 
X-CRM114-Status: GOOD (  15.59  )
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
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
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
index cb31fd3b12017..9b901bf8bab9a 100644
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
index 430dc49a82863..d940ba4f6a1e8 100644
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
index dcc102bf8f183..c43fcad737b73 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -225,6 +225,17 @@ static bool hwprobe_ext0_has(const struct cpumask *cpus, u64 ext)
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
@@ -307,14 +318,12 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
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
