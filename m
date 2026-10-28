Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581E160A261F
	for <kvm-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 22:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iBytNfGx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xfekL2eJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=soXJOedQAWjGdGBXk/yc8y9AVGRQ7B77wqoboTE8npI=; b=iBytNfGxVGNXNSkOeZ2TTLXUET
	Oxav9hWpI9ROEZ8ylTi4vp67slzVTwFI9sFzJi9o/h3alnyD3f4mDyNcXL/BO97SAful9KYMok3+M
	4DtgC8VZ3jRgcOewwnaO4fCbI29rqnqz21lg7H+gwSWBifVVtxZpfWbX7CyarJMYmYVr63P/fXRCh
	OIFRkawo+ULX7wVL51fi+IxGuOneovgA/9qCsLBFQDvLbjuJKVQ3q97PBYGfkrUw4jTHmkDHw+M/5
	e1kIHdLxjqKEc4MmmshnfZEoSBkjMk3v68q1UV5hiHTXDin04hfeB0i1RSVOMErajObwN8by/9UF/
	UuLfknpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMCMk-000000081wb-3VPi;
	Wed, 28 Oct 2026 22:43:30 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMCMh-000000081ty-3Csm
	for kvm-riscv@lists.infradead.org;
	Wed, 28 Oct 2026 22:43:29 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-91b54d1e9cdso12379946d6.1
        for <kvm-riscv@lists.infradead.org>; Wed, 28 Oct 2026 15:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793227406; x=1793832206; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qy3A1Vkwd/cDXLut21ZiXnCP/BKq6y64SvmrcYwH9Tc=;
        b=xfekL2eJk9Gjz+5JItAtLWGNJOkMG9y4zdtbIZi0Nq/q2f3QY+AqgSe++eYIb2sdkh
         k/V9/vWsOKOmssDgS7F9t/rKI5k8sTn49hwCC4VRurSAjvYP9BjILg+iCMS7AdJMCLUX
         8VdTSKpmPG5O3H0sT6Vrnwd0AjcyY0HNb7yTO4pHU+dWcHCAGtYejCjO2Aa9HLK+P4Hd
         kaXZbx/lCG/pMWkwtbfuTTcE+XfnZMPgZOFSj70s3haCtvMlSx/aNnf/6SJ6WrBhUxgx
         p4/Y8rM3vD6Ielq52T5IivCsi/sOmVlw+GxQQu+ZX8NbkVXhwy+reENBSGIw46YZuN1/
         58Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793227406; x=1793832206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qy3A1Vkwd/cDXLut21ZiXnCP/BKq6y64SvmrcYwH9Tc=;
        b=bFTc6NU7rGjjVs9HwHX7fv5ih2WhVeVIcQEz+soh9B6OZKU2zQKpKQLoESabTVwvhd
         gK/A1gosVj5zHhoV3Xxd/OVCo3cM1GJ85X9fWBiXmKUOL7Ca42/CjBBdws9cC5csVkhL
         FWprgjq/E2wfnfdZIkRY7wz1pcDzN1ggCLsmhvRPQWAdJCpJ/LERxzMKrxcFUpAY0vPO
         o7HuoArrmBqqzcL0nUwZfwhun/rdkZ234il5BMhuuAwKHz1qfpw2R22++YEsdWZtzELP
         e3wMOZXqhz+33EEHXEBL3kOiU7EfrSOFHL3Qqa8T+4ZhV8O7xFdET/vH3rTs1ph3Ajnc
         R/3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxHChgzvgAqKHYKzqcKzjvQISCQalBJrMH/u2Bg/KTTPoWCzgePSIYKEuMoNdeujVf4vQYikH1A2fM=@lists.infradead.org
X-Gm-Message-State: AFq9FYLWNHTohtnUYd0EhlFR7HBY1/jvf1VPUid9qzrrKRKiytneU55c
	xtek4Gg/5QLqx6z7AYqZ1fEJjCryp+RCA0oUjwib8WOjXh7Vokzih+pZ
X-Gm-Gg: AYBFou12DD5iICnDFybz6yG/gc4EWUy7i0+bEuugJ1gdUNTNNnQVBfBGfaFgxfHEwsF
	7oiqbgfeoqGn73bJVhJccOK5slJlCaEMfcVNWvWgqdIWj1ReYxNQ05w2m4ItPSBpR/GfDYtt2ZP
	vUAjFyJo2obrxiVbbseSV8uOFe8az/90SbiBkVlUFRsCE4dCl482BKycuZgiMCQV4CAFHaXSdF5
	N6bu6+bD+kEiBXAHmYvNyaCn9YVFHJl/XED9/be2wwHFZW7uo0EUFCGY4nwgEdEBnY1/aBs+kyp
	Wo5OU/DKwou9CjOM1KMB2uwku/eIwKwuzWsg+5SwSd5VQCigTRMOCM7lWBP6W74GRf9Z3pubBSN
	Ob9xoofgUVeU+nyZWNUOCeQmtfORgCCPwaEGP4wj7VLhF38KBBnGJEP3wH41nSIDQvW3q4COWkM
	D19/L456RpdrVFLu7PnD+G80D9hWiPiJ7gCdWUEZCFKY2F73hBGykSQxbj/wFSplXVE1MR7gJO7
	WMzV+qKBZ0hBeZozpgKKkkIteIHxV72AZEKo462VBx3x4VDsowAXeVRBt36HmZ3ezbJe3GgSw7E
	JkuWKsma9nXKOinVsOSWVqOOIZ2Kt8ILucrk1ZGfmYUt5gF5lsdYHV0KVhYH5FYaEIq2P7JxC/f
	1fb2MyghzKvEoZyv0ssqtUt2YKeN3el4LummcCL9Y82Py1b/1Xrw=
X-Received: by 2002:a05:620a:2629:b0:93e:c12c:9b77 with SMTP id af79cd13be357-94408d68de4mr575691585a.82.1793227405973;
        Wed, 28 Oct 2026 15:43:25 -0700 (PDT)
Received: from paul-white-HP-Pavilion-Laptop-15-cs1xxx.mynetworksettings.com ([2600:4040:ad65:1c00:b8:5aeb:4bda:886])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f0787d96sm1370085685a.28.2026.10.28.15.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 15:43:25 -0700 (PDT)
From: Paul White <paul.white.kernel@gmail.com>
To: anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul White <paul.white.kernel@gmail.com>
Subject: [PATCH v2 1/2] KVM: riscv: Eliminate redundancy in get_reg function via pointers
Date: Wed, 28 Oct 2026 18:43:08 -0400
Message-ID: <072bcc0994a5d2a0c21778a7a6f9e395395535c6.1793223506.git.paul.white.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793223506.git.paul.white.kernel@gmail.com>
References: <cover.1793223506.git.paul.white.kernel@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_154327_823469_346B8FCC 
X-CRM114-Status: GOOD (  24.42  )
X-Spam-Score: -2.1 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The original code is essentially asking: for each possible floating
point mode, ask if reg_num is a status control register or a data
register. It is redundant to ask those same questions for every
possible floating point mode case.

In order to only ask the "status control register or data register"
question once, the variables in the status control if statement and
the data register if statement that would be different depending on
the type of floating point mode (for example,
KVM_REG_RISCV_FP_F_REG(fcsr) would be KVM_REG_RISCV_FP_D_REG(fcsr) if
the floating point mode was double) were made local variables of the
entire function so that once the cpu passes the if statement inquiring
whether it is double point mode or single point mode, all the
variables that change depending on the type in the status control if
statements and data register if statements will be set to the
appropriate values they should be when in that mode before/when it
enters the status control and data register if statements, allowing me
to only have to ask those questions once and creating a dynamic code
that changes based on the information. This results in a "asking the
type then asking status control or data register question once"
structure rather than a type-questions, type-questions redundant
structure like before.

This results in faster cpu execution because despite the longer lines
of code the cpu has to make less decisions, which saves time in case,
due to its tendency to make assumptions about what an if statement will
evaluate to, it has to backpedal because it realized it needed to go
down a different if statement/path. Finding an address via my
bare-metal approach is also faster than looking up an object properties
and then an array. It is also more maintainable in the future. If the
original code needed to be changed, you would have to remember to do
the same thing to both type blocks whereas mine would just require a
change in the beginning if statements. If a new floating point mode was
added you have to ask those same questions all over again, which may
make the code longer in the long run.

I also renamed reg_num to token_reg_num in my code as I felt it made
it clearer that it was the register number the application wants and
requested in a token. It differentiated it from the many other
variables with the word reg in it.

Signed-off-by: Paul White <paul.white.kernel@gmail.com>
---
v2:
- Only checked whether size token listed was 32 or 64 bits, which could
  create/allow tokens with mismatched sizes and types to pass.
  Should've checked if token's size was correct for its FP type. Did
  this by replacing u32 and u64 parts with byte_offset because it is
  mode-dependent local variable.
---
 arch/riscv/kvm/vcpu_fp.c | 68 +++++++++++++++++++++++-----------------
 1 file changed, 39 insertions(+), 29 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_fp.c b/arch/riscv/kvm/vcpu_fp.c
index bb11e6757d34..da4f83be6b19 100644
--- a/arch/riscv/kvm/vcpu_fp.c
+++ b/arch/riscv/kvm/vcpu_fp.c
@@ -83,41 +83,51 @@ int kvm_riscv_vcpu_get_reg_fp(struct kvm_vcpu *vcpu,
 	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
 	unsigned long __user *uaddr =
 			(unsigned long __user *)(unsigned long)reg->addr;
-	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+	unsigned long token_reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
 					    KVM_REG_SIZE_MASK |
 					    rtype);
 	void *reg_val;
 
+	u32 *fcsr_addr;
+	void *f_array_addr;
+	size_t byte_offset = 0;
+	unsigned long offical_fcsr_num = 0;
+	unsigned long offical_first_reg = 0;
+	unsigned long offical_last_reg = 0;
+
 	if ((rtype == KVM_REG_RISCV_FP_F) &&
 	    riscv_isa_extension_available(vcpu->arch.isa, F)) {
+		fcsr_addr = &cntx->fp.f.fcsr;
+		f_array_addr = &cntx->fp.f.f;
+		byte_offset = 4;
+		offical_fcsr_num = KVM_REG_RISCV_FP_F_REG(fcsr);
+		offical_first_reg = KVM_REG_RISCV_FP_F_REG(f[0]);
+		offical_last_reg = KVM_REG_RISCV_FP_F_REG(f[31]);
+	} else if  ((rtype == KVM_REG_RISCV_FP_D) &&
+			   riscv_isa_extension_available(vcpu->arch.isa, D)) {
+		fcsr_addr = &cntx->fp.d.fcsr;
+		f_array_addr = &cntx->fp.d.f;
+		byte_offset = 8;
+		offical_fcsr_num = KVM_REG_RISCV_FP_D_REG(fcsr);
+		offical_first_reg = KVM_REG_RISCV_FP_D_REG(f[0]);
+		offical_last_reg = KVM_REG_RISCV_FP_D_REG(f[31]);
+	} else {
+		return -ENOENT;
+	}
+
+	if (token_reg_num == offical_fcsr_num) {
 		if (KVM_REG_SIZE(reg->id) != sizeof(u32))
 			return -EINVAL;
-		if (reg_num == KVM_REG_RISCV_FP_F_REG(fcsr))
-			reg_val = &cntx->fp.f.fcsr;
-		else if ((KVM_REG_RISCV_FP_F_REG(f[0]) <= reg_num) &&
-			  reg_num <= KVM_REG_RISCV_FP_F_REG(f[31])) {
-			reg_num = array_index_nospec(reg_num,
-					ARRAY_SIZE(cntx->fp.f.f));
-			reg_val = &cntx->fp.f.f[reg_num];
-		} else
-			return -ENOENT;
-	} else if ((rtype == KVM_REG_RISCV_FP_D) &&
-		   riscv_isa_extension_available(vcpu->arch.isa, D)) {
-		if (reg_num == KVM_REG_RISCV_FP_D_REG(fcsr)) {
-			if (KVM_REG_SIZE(reg->id) != sizeof(u32))
-				return -EINVAL;
-			reg_val = &cntx->fp.d.fcsr;
-		} else if ((KVM_REG_RISCV_FP_D_REG(f[0]) <= reg_num) &&
-			   reg_num <= KVM_REG_RISCV_FP_D_REG(f[31])) {
-			if (KVM_REG_SIZE(reg->id) != sizeof(u64))
-				return -EINVAL;
-			reg_num = array_index_nospec(reg_num,
-					ARRAY_SIZE(cntx->fp.d.f));
-			reg_val = &cntx->fp.d.f[reg_num];
-		} else
-			return -ENOENT;
-	} else
+		reg_val = fcsr_addr;
+	} else if ((offical_first_reg <= token_reg_num) && (token_reg_num <= offical_last_reg)) {
+		if (KVM_REG_SIZE(reg->id) != byte_offset)
+			return -EINVAL;
+		token_reg_num = array_index_nospec(token_reg_num,
+						   32);
+		reg_val = (u8 *)f_array_addr + (token_reg_num * byte_offset);
+	} else {
 		return -ENOENT;
+	}
 
 	if (copy_to_user(uaddr, reg_val, KVM_REG_SIZE(reg->id)))
 		return -EFAULT;
@@ -144,9 +154,9 @@ int kvm_riscv_vcpu_set_reg_fp(struct kvm_vcpu *vcpu,
 		if (reg_num == KVM_REG_RISCV_FP_F_REG(fcsr))
 			reg_val = &cntx->fp.f.fcsr;
 		else if ((KVM_REG_RISCV_FP_F_REG(f[0]) <= reg_num) &&
-			  reg_num <= KVM_REG_RISCV_FP_F_REG(f[31])) {
+			 reg_num <= KVM_REG_RISCV_FP_F_REG(f[31])) {
 			reg_num = array_index_nospec(reg_num,
-					ARRAY_SIZE(cntx->fp.f.f));
+						     ARRAY_SIZE(cntx->fp.f.f));
 			reg_val = &cntx->fp.f.f[reg_num];
 		} else
 			return -ENOENT;
@@ -161,7 +171,7 @@ int kvm_riscv_vcpu_set_reg_fp(struct kvm_vcpu *vcpu,
 			if (KVM_REG_SIZE(reg->id) != sizeof(u64))
 				return -EINVAL;
 			reg_num = array_index_nospec(reg_num,
-					ARRAY_SIZE(cntx->fp.d.f));
+						     ARRAY_SIZE(cntx->fp.d.f));
 			reg_val = &cntx->fp.d.f[reg_num];
 		} else
 			return -ENOENT;
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
