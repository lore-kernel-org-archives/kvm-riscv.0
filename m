Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A14CD8C9D
	for <kvm-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 20:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YIK4o9wPAEh8OfhC+kGsVk4OeqVE5zXioq8ydYggL+g=; b=4tbEdCHHjBzwRV
	BuYHTJOJsKPc+r1rAXk2aiVw8PCBeSoIQFtdsz6H04Q5z0G+U2WCgvcaCMgnhH9demYzuXv9a4Dh3
	4MoWtbAECLRDBFczkZ0LZapwrkf58MlDVPOueuQlUb1PsfHFN2loXKY4Dr6Su0D/zG+jRtzGDpVak
	iaM1QiKPbQtT1H0pHkpaetQgqCydQmi2rU9isr/hzZx8+NbWDOu31D+zz+LlJYahwK63G+Ip3TnBW
	DGmBnupU//8zPEYg44FMrLtExK+hijsu6U7/DSfctMgF4hN1oGVbVHimpf03ThoZa7TT9VHnXVMNz
	4bEUAwbHj10O7ZuMRIzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlmh-0000000A0sz-1p0R;
	Thu, 11 Jun 2026 20:13:51 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlmd-0000000A0pp-2IIa
	for kvm-riscv@lists.infradead.org;
	Thu, 11 Jun 2026 20:13:49 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2bf22d29dabso1887755ad.2
        for <kvm-riscv@lists.infradead.org>; Thu, 11 Jun 2026 13:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208826; x=1781813626; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZxM0nq9Qo37aSql2ij+ibdvlWTuLmx0z98uOay5MXI=;
        b=fDsLKjGOrRxlJ+0j5Eqgq9qXGvSCkZlpXlOWbkLbpIcBD79k1UjZYbzcB/KmrSjIRn
         CfjZtCqo9M6ZJEjDh1OF7GIWztzSYxiBpjW2q6OEOx6Ku8nDGRP13dmHfYmpr4KI/jOh
         0GvRtyBEHOBgE+pogLcY9a/SXn/Ps/kwPdWg1qGX1YIM+qSbpTVqMJvIjgx3CoXkaEwf
         22d0jkRk5O61cf0vH6/Rq9Pz/QW0YQxAULHIUaY2VvVq2WRC0w4q/ovozWk1Km/YCMJO
         g2C85o08klOigpkye1x01rINrXXqnaUSSvqzpxtaqaBsntoPPWPh6rjEMViHnfnsUlHH
         LTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208826; x=1781813626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SZxM0nq9Qo37aSql2ij+ibdvlWTuLmx0z98uOay5MXI=;
        b=F3uLyoijJxHj01aYwGzhxonlmUuNdncCY/aelf0SLCByDD55eHGCMiPrZnw6rnui2h
         THGqbXcxnsZYu2ngShX9AQM1GKOzl+nGUydI2HZbz1FG32rUo+Saar80xde5hkbOjidK
         tG2M/AQbKjyZ2J/MS5mvEtJMGRwLnZYvH9tiqSV9KRzGUhrHRiCLF6XSB+ZNjhX95OAD
         K4vEYeCXmnzZto9XJNJguxqc0bmmM3mR2+nPvFF+Fsx/elNgcTcuIbk5xToDEul1ZpKU
         DnU2TO3NLEfeY9Z4ILH+c97YF2XKki//+UbZ76bDEiD0zV3zNcEuA+hMXEysifO9CI5s
         2DBg==
X-Forwarded-Encrypted: i=1; AFNElJ+kbIZEQSoQctpBZrobqFaBIE/6z3TF8mdBQeLQT/e1JWCwmYt5qO7tNH1vKpu1gHYDAqccL95kiK0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwQC8ah0CaMDNwqVr6yrKywUY0Wdxjo/e8CRJhddjqVHxGrZec8
	3J1JyyGbl0QTMVpY8Xm8KY+ew91GgMIIRrI4wy2+yQJktSch30ZbVyll
X-Gm-Gg: Acq92OE+NJcVePfMoGmJBRyAPF5zO4H1tMpfJBzbznNLR5/NThR8JFbj+gFpfldcGAL
	ZDU3fCT/c0GduVVj1VTfClJqktv6iDntzV+HCakxasaMG5KpuMpoz5L92Bzsw4orl2shYLp63yh
	CX0mtDDpvuimcJi32Vz1+6uwsSZ42DJL06KWAb57XnxFIs/eoupdAre47alpvPZCfdA+Nq9kaZ3
	vXjaqMAoqkIUOBJcJe8Ek03o5Z/SWuEAVg76rxfTDdvu7NlB/VMyvdKgOwRyq09+aOpL0Nde5i/
	zFCmWczQKheoVHBVXjb2lmPsdaHZlkDKq2zKYNZPMhkWJKoyrhYVRysqd4p9o5FA2GXmIZXBuDO
	ciGUsGP5HxYcbG9jTCewtWjfI4T4nQjC6rrfwTdA/lTkU8kqggZVaw/yqbKFu0FzDAxEqsb7khg
	==
X-Received: by 2002:a17:902:f60c:b0:2c2:7baf:139f with SMTP id d9443c01a7336-2c2f2693495mr50380055ad.30.1781208826458;
        Thu, 11 Jun 2026 13:13:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm288730475ad.22.2026.06.11.13.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:13:46 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 11 Jun 2026 16:12:42 -0400
Subject: [PATCH v4 05/16] riscv: Add Zicclsm to cpufeature and hwprobe
MIME-Version: 1.0
Message-Id: <20260611-rva23u64-hwprobe-v2-v4-5-3f01a2449488@gmail.com>
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
 Guodong Xu <docular.xu@gmail.com>, Jesse Taube <jesse@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Andy Chiu <andybnac@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4415; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=5gK/AJ7I7Z0fBTNqkcRMKGgIqY4cXewYPVL687SON2g=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixtsQNLEkV1ZpjuVfdXemZh73iycw/Dg4u5M1YkfLdJW
 stekszdUcrCIMbFICumyHL4aEv21lc+0b7POX/AzGFlAhnCwMUpABM5+ZThn9Lc/lJlgV/G6qEu
 nGtbnFuuTzxYpV1zqGBWnqLL5KDMHwz/PR+Yh9lkftX7wVj0+dsrd/ENPUr/WiXcdKTYX/RVm5u
 wAgA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_131347_588262_413B010A 
X-CRM114-Status: GOOD (  13.74  )
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

From: Jesse Taube <jesse@rivosinc.com>

Zicclsm requires misaligned support for all regular load and store
instructions, both scalar and vector, but not AMOs or other
specialized forms of memory access, to main memory regions with both
the cacheability and coherence PMAs, as defined in the profiles spec.
Even though mandated, misaligned loads and stores might execute
extremely slowly. Standard software distributions should assume their
existence only for correctness, not for performance.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
[Rebased, rewrote doc text, minor commit message revisions]
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>

---
v4: No change.
v3:
- Move the hwprobe.rst entry to the IMA_EXT_1 section so its
  documentation matches the IMA_EXT_1 bit it was allocated in v2
  (Sashiko, agreed by Andrew).
v2:
- Rebased onto v7.1-rc2; moved ZICCLSM to IMA_EXT_1 and
  allocated a new bit for it
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/asm/hwcap.h        | 1 +
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/cpufeature.c        | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 5 files changed, 8 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index d9928641deb99..49d9fb68632d0 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -401,3 +401,7 @@ The following keys are defined:
     as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
     extensions specification, ratified in commit 302a2d45c243
     ("Update build-pdf.yml") of riscv-cfi.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCLSM`: The Zicclsm extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 44bf8c7d8acc5..e8f4a7dd96a93 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -112,6 +112,7 @@
 #define RISCV_ISA_EXT_ZCLSD		103
 #define RISCV_ISA_EXT_ZICFILP		104
 #define RISCV_ISA_EXT_ZICFISS		105
+#define RISCV_ISA_EXT_ZICCLSM		106
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9139edba0aecb..6819df159c51e 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -116,6 +116,7 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE	15
 #define RISCV_HWPROBE_KEY_IMA_EXT_1		16
 #define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 0)
+#define		RISCV_HWPROBE_EXT_ZICCLSM	(1ULL << 1)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 686dde3ce3b98..1fb595581adcf 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -502,6 +502,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
+	__RISCV_ISA_EXT_DATA(zicclsm, RISCV_ISA_EXT_ZICCLSM),
 	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfilp, RISCV_ISA_EXT_ZICFILP, riscv_xlinuxenvcfg_exts,
 					  riscv_cfilp_validate),
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index f8f68ba781b45..9cf62266f1890 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -205,6 +205,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		 * in the hart_isa bitmap, are made.
 		 */
 		EXT_KEY(isainfo->isa, ZICFISS, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICCLSM, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
