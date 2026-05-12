Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8422CD37AC
	for <kvm-riscv@archiver.kernel.org>; Mon, 11 May 2026 13:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hcc2LSALzIMSxhsI8NRdfVAJaL+THNmqTzSRbD3ia7Q=; b=ajQlGRHcEwROpQ
	XBfXVFQjDYpQ47/x/B9ZJGGbZCTURDw90ANXzxUbXbFBiQlDluNs7i+Mm2mdh8URBfPj8ncBGSrpp
	Sf+UYS43Y5h7R5F93JFGtxipGvsqYeKbD/+goXdWbmX7P5C4nRhmc/8VQdU6L5fq7YsVr/5MZ3FPb
	KqtlbzE91hNHS1Yd03w79J3SV9rKR14btsdczs85srKdmSKE9/LBXxETIr6RyD2aqqXROZAF2o5dc
	R+KXJVxk5ysI8093fQaN2FB133dm3EbXdnXpoF2v4zSPjgKNgPfPfOX0pBqD+nHRGRqYyckWoGlC8
	DrpX3vPnR41c0Qcnu18Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQoK-0000000Dlhv-2C18;
	Mon, 11 May 2026 13:36:40 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQoH-0000000Dlfp-3oT0
	for kvm-riscv@lists.infradead.org;
	Mon, 11 May 2026 13:36:39 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3665a90bcd3so2652095a91.1
        for <kvm-riscv@lists.infradead.org>; Mon, 11 May 2026 06:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778506597; x=1779111397; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zkBT5A6/LBnTeUPklgGzPFjB6isZzD11PPCRi8U3YM0=;
        b=eZnpMboOEB/2jV7mtonj2/HifWzOxtpahBl9zAJ03dEk67SxHLV6ytMqfV/nGLcXod
         j7qicXvVsHIZN9oKoA3pUgJal3P9mex07m2dDghDoBPW20g55akvedLbw5oEK0GpRjVl
         mpjou2q4bQvLU6QyNu3HQ+e635X9M400SQ+lw1OJnsrWRFcUc2lo9fLubViqZQy6T8oI
         VU12KYT5kjsdgkTVg0ttY4PHJqedQG06vAdC4eI7B6aHFaF4nxSp6RzJ/o6VswvqMTeI
         ElDaQIubNnf+DamxABFRYUKdf4bvbIYofuneC3Xi+humQgWXdF6eOzAPOKGz1y5KV0d7
         R2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778506597; x=1779111397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zkBT5A6/LBnTeUPklgGzPFjB6isZzD11PPCRi8U3YM0=;
        b=qpOMrBM+ZB2gF1tUVqyTioD3JMUSEQ2vVqE/n5AZpcSwAy3jpFUBFvGwbptBJxLo3p
         zjKi8s3RaNuKc1YK4QUA7tAidIgl/fAgbkw5fleSt5Y1Tu3pgXd81G7VK6r7qcvt6WrY
         cS8SO675E55mSORV6FvvAnTm6sgowg0CaCbj0ugqjGkRUSg4JWhaY754piySnpO3eBxY
         DyhlN+e8QaHXHpml3u5kJQnr306AuJr4VDpJcZUbKZDZzHyGXBc7FQX7TjIMIMP5Jzyb
         JspbUBLl2kEi/eqNRa4h5kGmBOhz17Y+UndqhJxnMjvuRCn0ucywVvtt/SnuFgMYJeml
         gnAw==
X-Forwarded-Encrypted: i=1; AFNElJ9vPLB61N4wapzghl4jnz5YpGjfvZf/nL296fMh+hpH400hH+RDc8DEDid035SDMiA4mdHNhX9Hcko=@lists.infradead.org
X-Gm-Message-State: AOJu0YwugvsJOXH4Q7zIse/+XIsXHmpjtVOBrDCwYQ/pdvfDUJk9SeQ1
	noAXfN68Zo5Z8wOFfnQp9mCEsA+kjEDMDvc9Um3ewTtxKfQK/9jntiL6F7D2QHWx4/A=
X-Gm-Gg: Acq92OFuhNB5/250XuKJbyJ52wyKDP2OctxVUpxPHDpGAfBHy+PdoCARQXvufvvjaSn
	/GEV9Y3X4FIDgClRffWs82TG12HIDXmtCiDygn7+0EzQ4z1z2s70E2JGMFM2g++XuzbVAsu6i2t
	p1kPF+RlYDQM4MPQiO7PYnOSYJOw/MiOvcmj2ByMpy4vz54VBJjnfkhI1LXEfOKUWr9h/sBMvsP
	+4/vqIscO6nhuhJaUq7mWrDcoV64RZubd29Of7XyVlGjD10xE+4wkByQmWRM7rub+70DKD8fUWX
	NGperQQqEZbJ00IKa+j6cbqX4HyCUVR+GmqMaA+9UFA5sX9Xg8uBUY1XyEIVkKoXm9DRgw4o+YS
	fV/M72fExmcyxjib04GUMqDbCb9/IWhvgUFAL553DJRjHQDoUKd7xqDjzttT7QOhQ+l1i32n1Vs
	oFNq81KxreTXu/Oh5dIxyWslbFtIY/gfd3c1JXDQxHNN0=
X-Received: by 2002:a17:90a:d883:b0:359:8de8:1229 with SMTP id 98e67ed59e1d1-367d487d1cbmr11028452a91.21.1778506596853;
        Mon, 11 May 2026 06:36:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30f3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367be3daafesm3034326a91.8.2026.05.11.06.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:36:36 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 11 May 2026 21:34:47 -0400
Subject: [PATCH v2 02/10] riscv: hwprobe.rst: Replace tabs with spaces
MIME-Version: 1.0
Message-Id: <20260511-rva23u64-hwprobe-v2-v2-2-21c5a544f1dc@riscstar.com>
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
X-CRM114-CacheID: sfid-20260511_063637_961846_E348A1BC 
X-CRM114-Status: GOOD (  10.30  )
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

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

A handful of vendor-extension entries indent continuation lines with a
tab character, while the rest of hwprobe.rst uses spaces. Replace
those tabs with spaces so the file is consistently space-indented.

Cosmetic update, no functional change.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: No change.
---
 Documentation/arch/riscv/hwprobe.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index b1a84ac06da75..c3bb26d70c748 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -358,7 +358,7 @@ The following keys are defined:
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR`: The xtheadvector vendor
         extension is supported in the T-Head ISA extensions spec starting from
-	commit a18c801634 ("Add T-Head VECTOR vendor extension. ").
+        commit a18c801634 ("Add T-Head VECTOR vendor extension. ").
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicbom block in bytes.
@@ -371,19 +371,19 @@ The following keys are defined:
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCDOD`: The Xsfqmaccdod vendor
         extension is supported in version 1.1 of SiFive Int8 Matrix Multiplication
-	Extensions Specification.
+        Extensions Specification.
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCQOQ`: The Xsfqmaccqoq vendor
         extension is supported in version 1.1 of SiFive Int8 Matrix Multiplication
-	Instruction Extensions Specification.
+        Instruction Extensions Specification.
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFNRCLIPXFQF`: The Xsfvfnrclipxfqf
         vendor extension is supported in version 1.0 of SiFive FP32-to-int8 Ranged
-	Clip Instructions Extensions Specification.
+        Clip Instructions Extensions Specification.
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
         vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
-	Instruction Extensions Specification.
+        Instruction Extensions Specification.
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicbop block in bytes.

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
