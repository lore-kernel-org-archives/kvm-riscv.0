Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498FDCD6E64
	for <kvm-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 23:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mz5S4N89AokV6ujLlYF7a7PuFj6lHXpVDUTb2VXFoCQ=; b=Lb6HdompGW7XPw
	AMjqodaN7aBUnPvqco2FhajvuJfT7vNqc6BbrdzhNTkGPtnnPkx6RC7eswMuHMMuCiDWG/abXZXVN
	3rObC/9IhT1PcmlSsw9dmv5jF6uB2+EsXN53G9rEtX9V+LGYRa/9t4ZLMxIkWDorQy6TqO6HLnUkm
	Vm4wozGZa9ntFD77bh4tizKkjgcX9MErb1Qsh2VKdhMHG85VlJ4z8+4UO6FPImxu6N3pTmFcAxd/S
	mbr9jyF3InNv+9hrdOq14W5rDmJ8hq+dREe7GAF5huiIXkwk/voiaWinr3LDi302fyDNvHwmhfm0d
	I5uMMHkd76/Fhy7gm/aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUYIK-0000000DvHZ-3BkA;
	Tue, 02 Jun 2026 23:13:12 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUYII-0000000DvFy-1iSu
	for kvm-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 23:13:11 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2c0b9328c4aso24164525ad.0
        for <kvm-riscv@lists.infradead.org>; Tue, 02 Jun 2026 16:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780441989; x=1781046789; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hHFIY+oFxYCby8roDhyuYsQin7Ul79zLqHihVHlWSyo=;
        b=YKJOV/oWgEpjaeUEzWF735O5P2q2EKsLh/Sy344f8qNYKXo4Ha2gUVG/v//H4aSMnQ
         ZU1BwxQ4vVr/SpHTmLonJkGMkyrZFFJ6kTqfhlnY8YXJ8a5bwKY6Ugoc3cjJS07fkxaQ
         AcxYdVHzvHMdZ2uhHXUe643ajALdwKKfy6Mgty4/17q1S1t2oBg7hRa6Py7NtmUZHYIk
         dbZdF1ye5H3SaGjkQI9HK6voCC5NU0XIF1t2BkMN5mHXhZ8lTXDCEru5i64baQ1/6XWp
         K4y3Znpv2kvEjWP8ZaEXBYPV9JYHx/oUrA1KyU8haRWGtL2VjievjOLdWdmD7vlP6KIV
         Ndig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780441989; x=1781046789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hHFIY+oFxYCby8roDhyuYsQin7Ul79zLqHihVHlWSyo=;
        b=YzDdp4AQyZtsqay8YOxVWfuImiGual6Cn4IyBLi8DlBB2QFks5Mdo4Qt+tSik5LDxL
         oqBMhfUgj2M3qIjHH47e5s5tM3bq87cIjDlCiJv7b2pBxjcjP6ti8XPf/apMEY0j5Sfu
         Io8rymVZ9/ecUJ04gsmRegFfU5Lpxc4plsYukLr42oucw7FD4BGFaGghQU/ZqEHKbKoj
         zACV5YXAUVPEqWs8tpqpS2lxZGVg3vTyYT+OXEfseCFuLKDTCsH5sDx+/UBCfzvfxGyD
         HvV8YBUOvOoR41+DuS6M/K9va17do50ShZgLfa/sMscwJ+4dtffaGRIxl3s2Khw9SIvU
         YmaQ==
X-Forwarded-Encrypted: i=1; AFNElJ/If92DTNZEU2SKghQj77oLZBQy3zjpvdhL1SNJQPI6v6qfUtGfUzH+s/e5Dui5ebepZGKklqlO94o=@lists.infradead.org
X-Gm-Message-State: AOJu0YxUNN5jkUfm7/N5wnEOkf7z14eGV1WZBPYpyemJn+T8GANXJ5qB
	aKHAcI+eyz31kRi/WhuWDRON8kQ0vJTYBjHxA0aEgoF7e/TqALZci+rf
X-Gm-Gg: Acq92OFPtuIBqVj7vrLWHLHU9tUCuEbLk+TVI+Np+PwVb6Nsf83Mv4RV+kphbZQWleX
	BB3s0omU1inevHfBAWMeWBmIpi2tT0oxBIC+4/mArB+x/e/bKqAlg+71aDHKb7nLakFx98xftjY
	iTit55tIHyfwAgWpL8+hsKE/WbeMjGfs82RdTyzYCKUbACiZk6HNIhE51R7uXJjyX20llwAc32C
	FlhoyI3sdFB6NEr5giLs/sOU6cO1n2n7IVwCP7jr8yoPdsUhnnjF7CNhkjvb5Ir6FdI5OIP/gzK
	kxcMTVOkcYMXW5xnsj9fliCTAEl/NfxhUmcLqqHJ9CPe2vv+YWQGGz3FjM2VfIQMeweSkntK06B
	AOnqT18dHt9FVD9MLfqcYo0H3htoJnex8dE/nEOlPRyWwz68352Tl/DeKh7mLPxW1pnoRb6rR5C
	Nh2eOCRigLQ/PFxebFbRsf
X-Received: by 2002:a17:902:c950:b0:2bf:3074:34dc with SMTP id d9443c01a7336-2c163a59aa1mr7469645ad.14.1780441989552;
        Tue, 02 Jun 2026 16:13:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649d2dfsm3302965ad.75.2026.06.02.16.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 16:13:09 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 03 Jun 2026 07:11:57 -0400
Subject: [PATCH v3 02/15] riscv: hwprobe.rst: Document EXT_ZICFISS and
 EXT_ZICFILP
MIME-Version: 1.0
Message-Id: <20260603-rva23u64-hwprobe-v2-v3-2-5529a7b28384@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2083; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=rqTVVVJCoPVd96u+yhPMJffItnZ+P3H94JKRDHrTXaQ=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiwFHmbj4O13uthymy6JvU+rEL4dKfZMr+tUpU9DpyHf0
 ydWIhM6SlkYxLgYZMUUWQ4fbcne+son2vc55w+YOaxMIEMYuDgFYCI1PQx/eHnlc18+d3FcUZbm
 v82hY/8q8W0sHw4vvh+j1hzCevjDDkaG66/Wxs9YyBsrs37Fy717DyUeav92P6Wk2bE7UWuB6nZ
 dLgA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_161310_443254_A9FC27AF 
X-CRM114-Status: GOOD (  10.75  )
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

Commit 30c3099036a9 ("riscv/hwprobe: add zicfilp / zicfiss
enumeration in hwprobe") added RISCV_HWPROBE_EXT_ZICFISS and
RISCV_HWPROBE_EXT_ZICFILP, but did not add matching entries to
Documentation/arch/riscv/hwprobe.rst.  Add them now.

Fixes: 30c3099036a9 ("riscv/hwprobe: add zicfilp / zicfiss enumeration in hwprobe")
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v3:
- Also document RISCV_HWPROBE_EXT_ZICFILP (bit 63 of IMA_EXT_0), the
  sibling enumeration added by the same commit (Andrew).
v2: New patch.
---
 Documentation/arch/riscv/hwprobe.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index a09a8f16bd16f..3cedaaa53f331 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -289,6 +289,11 @@ The following keys are defined:
     defined in the RISC-V ISA manual starting from commit f88abf1 ("Integrating
     load/store pair for RV32 with the main manual") of the riscv-isa-manual.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICFILP`: The Zicfilp extension is supported,
+    as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
+    extensions specification, ratified in commit ff03d8485a04 ("Update to
+    ratified state") of riscv-cfi.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
   :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
   mistakenly classified as a bitmask rather than a value.
@@ -391,3 +396,8 @@ The following keys are defined:
 * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
   extensions that are compatible with the
   :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICFISS`: The Zicfiss extension is supported,
+    as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
+    extensions specification, ratified in commit ff03d8485a04 ("Update to
+    ratified state") of riscv-cfi.

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
