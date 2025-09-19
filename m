Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3237CAC592
	for <kvm-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 07:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gx+SS4/B6MPG9O4W6t/RjKZmNCvbqmuetqn6VnUyQAY=; b=p8V1kPATIanecW
	u4zvTuRKseLSNhf61vtbUZeZMl/LuL5n/UonIGvloWGh0vd5HBT7CbWzxxve3tsYxcY+Sc9ezul7Z
	OOzTJE+sDVUGyEdTSAgKj71/CaFTjEytkrqWeee9hsbBp3E/xEslEg6YjuXehI81hsu0d1Up8xrcm
	YEX92A7G85I/PJEmK1g4aroSCODROqpo0jUim23+qCupnYYeaI784e6P+7Ipgpeei5OrOrOAXIM0+
	S0zbYczU+0DzggstHRtylKwTxBO7D9fEu/tKA3XGDGbNDfW2Pllp0zQT3si71aEcEpDkNzP0jTFIG
	UNu6mHW9hzGkTFw+sAIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzViT-000000026J4-2cAc;
	Fri, 19 Sep 2025 07:39:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzViR-000000026IB-2ntq
	for kvm-riscv@bombadil.infradead.org;
	Fri, 19 Sep 2025 07:39:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=nvb+N79+1rz+7OJYvNB/1WfSxRwqST+oSw7w/swSoZg=; b=dMQAbBeaiqHc6VLGQlqmXN1664
	HLgeOIX1gHD8MVbqEikRWUYH1j9r7U+qhe4STyokI+auIDjF0B8NxydLHNFaSa08425AAe9WHure8
	JpdP72LxbOwkoKXyu5vMFqnwVWcm6n3rX55SB/zxQMRWBvRZi39mfwPYIoFiADHbTa5PtNBQBb6cF
	zluAmu9Ta17WefsBaHQZpu3LRcFuILoQ6I2EzGNODhlovOb3so1Z6jnk7e4UVDXspuZRVsCQ64GLt
	Fn6PCpxd8cpNhF18pSfaUIiyfld5kf6T6MDVbpaw6JJyejYlo+/Y/6eiDAzkDQ9iVNl/jEjMl01CB
	+o1mx+Wg==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVhj-00000007lhj-1veR
	for kvm-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 07:39:34 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-77e6495c999so582826b3a.3
        for <kvm-riscv@lists.infradead.org>; Fri, 19 Sep 2025 00:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758267522; x=1758872322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvb+N79+1rz+7OJYvNB/1WfSxRwqST+oSw7w/swSoZg=;
        b=BAd6J+RLjI7KJHtQlwqo1u5tmeMDvRGs9u56+H087pYUrJhKwkXhrJjZT+lWXFM60e
         AygTN1e6ZwT84rhgwhTgqufW/FXpujQ5IoU+O9OZT1wT4P56Us1uBpqxUD43dR9tUK7J
         40FLa3zX1clrsxGtzIXu69JjmwdBC6CB6YicItJGyzzqHFr1JuTPTWTbpdKj8uSNidzi
         XFueY3pL3e6O3Ymis1l8/7HBUNoNN6mWmsSqDknIHOqtQzGKohPyDhF6JVACLFzDEtiZ
         PRfdNppVCESub7cOfvwIPvNbQU5AhFjC84h+Df2PmOYwW6J3AvJUk/hQYEDP3y0Qn8+O
         Fsrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758267522; x=1758872322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvb+N79+1rz+7OJYvNB/1WfSxRwqST+oSw7w/swSoZg=;
        b=BO6lTy+kjgV8tVNYQr18Z3Nda8YdDuaoK49YKIjTrJmoPFFZ0XSOBiGDlQzUkKpkbN
         ZEWIwM6NTKJMyZlmM/BOmpGcCH7z2KH1sQyz9q0Jg5BcV3YxAylgiT4YxVRHE/AFtjJs
         lLE+fkrBbvbA4t+yb0XWauXC/sKV0crNpMac4krt5oQFCtltrk79AjD9qNFaMax41oFb
         DtxLZ+KIj8at4Rmx5cpA+Kopd/9Q6M6yiTjCJHdESenm6rP25pveggFj216ppcKzTmY4
         a8uSILHNxHY+dd+cTTEMBxr1AYYzhg1b3IQAhpoX9vbCzIMNsNI+W4B8Ph4cIV5vQPaQ
         GvtA==
X-Forwarded-Encrypted: i=1; AJvYcCV75rLmFAF6Q7YK2TOhHkf/Ub0/+/Up0m5nEuNABQ26DdoacNJshEC2WDEWp4kqz7ZP47es1pDzXxs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwunGxDnRU4voxPlYp7cZ/tN1ReuNMM8+tqYM3cExH4kMrGlL0C
	zUydFYwvWWKK1zuOB2+O1Hy+5zBPgGftFdbAjLz8K4rHUS/JkLAUUX1g7xcCpNEveTQ=
X-Gm-Gg: ASbGncuPyy1EENJ1ZqlirSlvUHvU8GUJaProWJysXPTTTBCrQiLCZvZ+od3HpfCy2Ro
	SKOxiDZB1lTR7vS8R+VAblGhPhfpGq6e7yTfxNglSrsjUtVyW1CRcsiwPgt/WE52CRubWO0ye6p
	v3wRdQRO5lqPevszBPKwEEamPVKfeMkh591TR8TbABf1L/b1DX0yQHeHu4ki7Q/Vj02Ztpa63HV
	AF633enLwaZi0HaOIg4Uwu0MF7N70F6QZg2rTh1T8iuUENHdF/SFPsoR2Nb6xu9HOUbpDOBAC0j
	/ROsHX5I/UkLSgxs5ttbjFvLzKrAUbkUKQhUfUV+xy0EfZAM51g+TTfSopZI9DSapiewu5W6UjG
	fM6vhAgpJzp8iA9F1Gi+pFAZu6jaTjPXy/uhzWTBbvb5tPrC3XgZd7MU/r3zfNSrFZzAPjhPXO4
	c4bDygDul0iYZ/fJBNLaQh3OPIkxohkX4csEjMYNkfIg==
X-Google-Smtp-Source: AGHT+IG/JWbqV8e1pPBSIjwkXI4z09a5l0oBx141z64CDaoUW0Ejq4ZhQwv8kxbRs5Suvs4P3rGR7g==
X-Received: by 2002:a05:6a20:549d:b0:250:b053:53c5 with SMTP id adf61e73a8af0-2927405e4c0mr3586688637.51.1758267521877;
        Fri, 19 Sep 2025 00:38:41 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b550fd7ebc7sm2679096a12.19.2025.09.19.00.38.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Sep 2025 00:38:41 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v3 7/8] RISC-V: KVM: Allow Zalasr extensions for Guest/VM
Date: Fri, 19 Sep 2025 15:37:13 +0800
Message-ID: <20250919073714.83063-8-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250919073714.83063-1-luxu.kernel@bytedance.com>
References: <20250919073714.83063-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_083852_475171_1BF23280 
X-CRM114-Status: UNSURE (   9.08  )
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

Extend the KVM ISA extension ONE_REG interface to allow KVM user space
to detect and enable Zalasr extensions for Guest/VM.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu_onereg.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index ef27d4289da11..4fbc32ef888fa 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -185,6 +185,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZICCRSE,
 	KVM_RISCV_ISA_EXT_ZAAMO,
 	KVM_RISCV_ISA_EXT_ZALRSC,
+	KVM_RISCV_ISA_EXT_ZALASR,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index cce6a38ea54f2..6ae5f9859f25b 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -50,6 +50,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZAAMO),
 	KVM_ISA_EXT_ARR(ZABHA),
 	KVM_ISA_EXT_ARR(ZACAS),
+	KVM_ISA_EXT_ARR(ZALASR),
 	KVM_ISA_EXT_ARR(ZALRSC),
 	KVM_ISA_EXT_ARR(ZAWRS),
 	KVM_ISA_EXT_ARR(ZBA),
@@ -184,6 +185,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_ZAAMO:
 	case KVM_RISCV_ISA_EXT_ZABHA:
 	case KVM_RISCV_ISA_EXT_ZACAS:
+	case KVM_RISCV_ISA_EXT_ZALASR:
 	case KVM_RISCV_ISA_EXT_ZALRSC:
 	case KVM_RISCV_ISA_EXT_ZAWRS:
 	case KVM_RISCV_ISA_EXT_ZBA:
-- 
2.20.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
