Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662D5CCD199
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 04:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h6dQytLyfo06Jie2/9F4szBEYOkQvkG6QuHXt8liqvU=; b=ZVFqfmUpMQG2BX
	tpPr1brfopu66Ydz1opybAxj+6X1OG52kjmK5lVuFT+/oAfy7KXcbNez+pZK5T8naoL77CkyPHgu6
	4WcB7wXSgK0lUNSkcq9TzeC264MdPi5efLM7YTNc7yednwDxuNQVVtIlGrvClHFPH2xp1MQtCLtgb
	/brJ7XuYYYVKnk0S1ls3uKV/gMAm9N/QDbCIThAxC+J+bWuawLPuUjGZqYp5mKO1EfOipF3cfCSga
	i174sBo2rSEnTLJtY0OHGhq1HqE3dyWcx6CJxDibr9i4+oVhFuqU7H8CwEG+lIYfjjnVDNycs/VM2
	hZ2XIMx369AHc8e7j/Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhOc-0000000BpgA-3KaF;
	Mon, 20 Oct 2025 04:21:23 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhOZ-0000000Bpe4-33is
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 04:21:20 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-28a5b8b12a1so40188725ad.0
        for <kvm-riscv@lists.infradead.org>; Sun, 19 Oct 2025 21:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760934079; x=1761538879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4l4TBk/LGXRpjovIOSrhrLfanQNTxjIirl6+Uo+sE8=;
        b=KXTdG67LvuVXXuNrdm1s88MyPZBTGM4lNwiBfSeHJGNzBTTX0bNhYX9zSPaz6dd8/S
         PTTOMPVMfXe/TedmLhmlv7cW0kjT8PkSVj/m9bAajxrHJFUsX56K7tVxMQSUuPUT9QMw
         Ei7YR2Lhzawr5I7/8EA2KMG+SzWM+e0UJdmezXfuTYwnXCZU3XS/i0/U6ghBW6OboY9i
         Yn7hJSu13S8YZVBO7tit/f4GaEgHj4TFfR/jyevpaD2yNW6J9zVSYfIbCp5gC36YwmmX
         +tcf+Cl7RaYJtQ8ExhY6Xc3z0zIuGFZ4hwhoGo3XcIWW1t+rNSWPboPQXM72Ue1Z/eUz
         TOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760934079; x=1761538879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4l4TBk/LGXRpjovIOSrhrLfanQNTxjIirl6+Uo+sE8=;
        b=GhOfL1zRQeIqK7VYqXew/bW29xbNef68krYT0B7Sl1DLOsLpk6Bg7gEy8GqqczIw8W
         Ssi8JKdVUGtwHDUx29BTdn8Z7xILRbFQErYzZZkq3WRFW/X5QNq1iQFSruGyL7R5w5Vm
         mCg1e2YlIt1Ix1wemiik0G3hNwmNrKEA7pYjfr6DbMw8diLXMbobQUb9ELe/8mpngRPA
         +oO+dgoqkJndUJ5usH+Y6CgF88SJslF5vwF9TFLpIdR5wSy86y6FOhWFE2kkmmJeXBLr
         aNi5F/F+yI0p2M7hR3LJrQbpu+8OH2tqFlH83FAzJfljOdwk4G8loUM7Sy50zU942cyl
         /6kw==
X-Forwarded-Encrypted: i=1; AJvYcCVPJ4JQxfC5Ce61R8qLWmxQpstqgTzy+UHtjtfE5sXpEQ623fuk0JO0bjUY6Nvpk7TZNT4SIRyC8PI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5SRXCkbkU+6pd6ACUC5Is0Obg/SJ7KSpFDkfD+jvn3P5OZN/k
	lYg84lMEXDtBuAKlP1SdZ9oBQU6rQd7l9rGunpmPdOy5umxcHwTKsD1bUaOPj4J9jis=
X-Gm-Gg: ASbGncuSSxyPmVrtU97RfTxKT+qKEtky4uZjhjXVdsh5m/lEH2EwcUSGHhAtNk5fZhx
	99qIBpWTzuuTQ8Ehe3HRl/0RIcGmG1vPcInFamX3LdFomwrTr1r0VKg9OLFwvchbQ1M3r8//HBw
	FWEsE36Pw0SmGU9WI4O4Jbf8SbkbToeytjBPc5X26M/7CWmcLzzyc4FRfLmYjrY9ZoChcbQktLN
	fIepupQZMHHmnND1u6qA60P7URyeGORVtkpIkg+s6UP6NaeJVwC/eP98cjjM8uq/UmMlsgkDoqE
	zxUE4xHf9UTwsLnpDncovlxz8GqIQ7J/dAGrwQdwkTSjro0dDGJeTaddi7j+B1TJWsU6gAOSF/A
	AlbJsZrI/TC8VW2LfXCc6AWk0EXryDNi5XbHZvhFyeSvFFV4PerCBtcLrI3rY/k5MvvKKl6bOG/
	Z0uicfI+ba4V/3nEY/y6c/jw7dsvxBOr/7CFcVdp+wmJ6fhwyAC70Oyw7byr7OSQWyAzaA54KZZ
	j/Hi8oUddIQ
X-Google-Smtp-Source: AGHT+IGSr6CeYbnbhFqLb/PEPw/yfGu/4coKFj18cuRK0sGNHLwIgZvYXiVeS+ZT8M8+GdgG4XcYZw==
X-Received: by 2002:a17:903:120b:b0:290:cd5f:a876 with SMTP id d9443c01a7336-290cd5fa92emr146909545ad.13.1760934078867;
        Sun, 19 Oct 2025 21:21:18 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ec14e9sm68762035ad.9.2025.10.19.21.21.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Oct 2025 21:21:18 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	guoren@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	lukas.bulwahn@gmail.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v4 01/10] riscv: Add ISA extension parsing for Zalasr
Date: Mon, 20 Oct 2025 12:20:47 +0800
Message-ID: <20251020042056.30283-2-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251020042056.30283-1-luxu.kernel@bytedance.com>
References: <20251020042056.30283-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_212119_781887_38F31E15 
X-CRM114-Status: UNSURE (   8.22  )
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

Add parsing for Zalasr ISA extension.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index affd63e11b0a3..ae3852c4f2ca2 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -106,6 +106,7 @@
 #define RISCV_ISA_EXT_ZAAMO		97
 #define RISCV_ISA_EXT_ZALRSC		98
 #define RISCV_ISA_EXT_ZICBOP		99
+#define RISCV_ISA_EXT_ZALASR		100
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 743d53415572e..bf9d3d92bf372 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -472,6 +472,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zaamo, RISCV_ISA_EXT_ZAAMO),
 	__RISCV_ISA_EXT_DATA(zabha, RISCV_ISA_EXT_ZABHA),
 	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
+	__RISCV_ISA_EXT_DATA(zalasr, RISCV_ISA_EXT_ZALASR),
 	__RISCV_ISA_EXT_DATA(zalrsc, RISCV_ISA_EXT_ZALRSC),
 	__RISCV_ISA_EXT_DATA(zawrs, RISCV_ISA_EXT_ZAWRS),
 	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
-- 
2.20.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
