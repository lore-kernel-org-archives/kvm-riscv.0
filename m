Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC6ECA6002
	for <kvm-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 08:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I7M43It7aMLi7lpjXuIapS3Bm0PNTTtl23506tLNNo8=; b=HU2fnZoVNfl3iD
	cqhKLFLS9AS7qxCD8Nv5r2p68tyEHowNAq6R9ksyQMVYzfkAiCECMm/KYkhllim9xhlb7QKwBiDZu
	5Tt3GgGl7BqlJs6y9+a+j7JRHFVudH1apcGrJXtYF8IvEOMhsjSmM/21hVVLgO+pqYyph/YmGFnES
	LRWU8W8OjVGE/4y019gtq/uJYbD+XzhkLOC6tpCyNfiTflXtwuJvoYy7AD346WF27hKFsr+jpRcGt
	04RkAaGsOFTMfLUM4/W/ELVuMX23woXm4F7lBSjMOUf3e4P03N+MlSgrFsdLT5PibxQskoBRMKeyf
	tgUHf4Taa6ryvIVaF4YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENN9-00000001zOM-23VJ;
	Wed, 07 Oct 2026 08:51:35 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENN4-00000001zKv-1BYa
	for kvm-riscv@lists.infradead.org;
	Wed, 07 Oct 2026 08:51:33 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-1419d3416ceso6846072c88.0
        for <kvm-riscv@lists.infradead.org>; Wed, 07 Oct 2026 01:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791363089; x=1791967889; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPRc8TVOWkVWbOW79DTb/n8a1v8Pn81m9sQQRmtvu9o=;
        b=QDh8nqqI5HJOZLeW9ONKQIcMt3RFhraoSo+4UdNtqNXI79N9C+Jh07ZmSP8EhzEhtk
         Wv2WZNP9e8N+ae/B/iAgzDDQlYuJD+CAoKGYQAeB82i9f4rLBuNaRtk9mq1+gjgXJoWc
         BGi0rhuKt4Ugl3hWxPr5snuWmvPLKEjEkBmKfZgH/DwaImRv1A1rCtZ7LgRzMJ9h/W/S
         /0ipA7trYTDvoJQ2ACgvlOw6aHtW4o6iXbn1IIl0DNpwLI1cSmhlGRQ1oMwNVCxjvsHB
         wydqbtJdPujNkBDBsWb8xPXMceDfiHLfH0auHGrCtznq9CRxj32izoitwxrlTqxm85Bf
         lrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363089; x=1791967889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UPRc8TVOWkVWbOW79DTb/n8a1v8Pn81m9sQQRmtvu9o=;
        b=Mn7jRUGo4lVOuttbB2iEsar4+0E8Jeo0dc7jYa/eS3C7yTtTGIeQVWQEnptQNAH0gu
         Y6moV6vYHKjxLFoewYPr/ffh9Wgo8H1pSlvLqewiv6ND6sBUNgDxpNKCGaY3belCjuwX
         Jn+BiwS3ulIOiyhGqt+/qtp8/KL0DTW0Yiu3XeyZMdcP5+vjIlWDCPOhxTWrPTGb+0np
         Z4F3ki/UVMB8khnRZ5426Awdx7M9qNZaJfaWOlmy8t09E8ktGfwlA13BQfQgKKMegJNA
         XNFrKrF3tmWvXEsdD1UeSgSECpD0BWqq74pq/Y/ZWLfqYn7Sec/3PN17vyM8/dIvV4s3
         AX5g==
X-Forwarded-Encrypted: i=1; AKwUvBww8uVnhYt1Oc613owfFCCRxEfakJ9gXlKbF0hvJkg+4bX5eacm4Xo8BJErZufHrexY8ZjyaGFsFVY=@lists.infradead.org
X-Gm-Message-State: AFuF++knG+SmeiLYP9w+Wcb4o0dW6Y5k3eMpi3ahRYMekIL+vXnoyrmY
	XyDxynMAJYUHPstQzNqJ+XxGvOpLV7ti/ZRBpB4L7ZOEgPie35aa7nQo6m8szeoa8KY=
X-Gm-Gg: AYBFou0Py5uEcog8DIXT6braIjejphvBqdkEt5MSsuHfXbT2O9ceDCIiqc8zl2wiBHj
	ik8rLIxkfkv2z6vlw2W1+xi3Ubg23adjMGjOoL36llXEprA80uNs2KMvUABvfFRVmrSpKtq2g4+
	/7lDaxJRf4EkQgtLtSNigkdBdyMpOrlvYK8FRXyUUYljlXYvHrxOXvvPeCOWr5Z/t1KyXOBZP3r
	zcT0fkEfyhwiYtJ1dXbkUglRW4ZAtuZ/OoWLPOLxgYOUO2s1pPaNzGFjhhYM0VJQrf+De4RprAQ
	GmnkmmUlb+uwXStycFrSA6fuU2Tt57qB5tQ9km9p3q25ibGj4MO+n4TEfWp3glHRIruNOVHA2Ea
	FSUTZve7pNKp61wkZ8gtZ+OBXJSTk50Ruo9iZRkKMzhNc6V8cODVGGdN5hJWypH6Cf3G+ogX0Iq
	2McLI0YwBt+kzqff+oEszqfMcB5v3V1k7shk0hyXIXjejRkyca5AZ9vOZGXQ7V3uTjG2hDquCKz
	0N7lVJdJvT26Eo4CHe6
X-Received: by 2002:a05:701b:4518:10b0:14d:3930:647d with SMTP id a92af1059eb24-1620374de3dmr1490658c88.9.1791363089288;
        Wed, 07 Oct 2026 01:51:29 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-163e3c5bed6sm396251c88.7.2026.10.07.01.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:51:28 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Paul Walmsley <pjw@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Andy Chiu <tchiu@tenstorrent.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 1/3] riscv: Drop CONFIG_RISCV_ISA_V_DEFAULT_ENABLE
Date: Wed,  7 Oct 2026 01:51:16 -0700
Message-ID: <20261007085126.222688-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261007085126.222688-1-samuel.holland@sifive.com>
References: <20261007085126.222688-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_015130_316653_5F063313 
X-CRM114-Status: GOOD (  14.06  )
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

The ability to prevent userspace from executing vector instructions was
provided as a escape hatch for software that was broken by adding vector
state to the signal context. This appears to be unused in practice, and
creates confusion in the extension support returned by hwprobe(), as in
this one special case an extension reported as present by hwprobe() is
unusable.

Since we believe it is safe to always allow vector usage, start removing
this functionality by dropping the Kconfig option. It is possible to get
equivalent behavior by setting the sysctl at boot via the kernel command
line, but that method will also soon be deprecated.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/Kconfig         | 11 -----------
 arch/riscv/kernel/vector.c |  2 +-
 2 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d6c2dbf8455ce..e26450f0d38fb 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -650,17 +650,6 @@ config RISCV_ISA_V
 
 	  If you don't know what to do here, say Y.
 
-config RISCV_ISA_V_DEFAULT_ENABLE
-	bool "Enable userspace Vector by default"
-	depends on RISCV_ISA_V
-	default y
-	help
-	  Say Y here if you want to enable Vector in userspace by default.
-	  Otherwise, userspace has to make explicit prctl() call to enable
-	  Vector, or enable it via the sysctl interface.
-
-	  If you don't know what to do here, say Y.
-
 config RISCV_ISA_V_UCOPY_THRESHOLD
 	int "Threshold size for vectorized user copies"
 	depends on RISCV_ISA_V
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index b112166d51e9f..9641343732782 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -20,7 +20,7 @@
 #include <asm/ptrace.h>
 #include <asm/bug.h>
 
-static bool riscv_v_implicit_uacc = IS_ENABLED(CONFIG_RISCV_ISA_V_DEFAULT_ENABLE);
+static bool riscv_v_implicit_uacc = true;
 static struct kmem_cache *riscv_v_user_cachep;
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
 static struct kmem_cache *riscv_v_kernel_cachep;
-- 
2.52.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
