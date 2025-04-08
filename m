Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D955C369A8
	for <kvm-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 13:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4isjRUpzrXC0cugM4HGnXxCAcdoR7qg4t5rtoAfzCfo=; b=XwycsmtvNPuF9/
	0Ej53+btQ2HP8xTsvaBfD7Y4ctaKtkOrz1K5qwasd/N738nJqvBOj463NenLFxVr6vqDi/Zl1w9Hk
	i6pwmeEDve4Wt54xW6qLYy5e66Z7mFPJ5Y+6974ZVQPgL1tyehaPF0o3IPlSSdAWLTXjUfR10IkRI
	ku+qsemIfAuxW/a2DA6L1hCQZ/ppje+sErl85EWdR/TWRwfaEziRBeRystkUjmMN2YSyNn4IhNCvc
	Fdi0fQrSazcIMPE83w3IFgyVzkAyzk+A3k/StMLB3MSEIbJrIPdkQy5BUlC1DMEfOsmhRQBnet8h8
	UlQUsmLOMAAMpcZyo8fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29QG-00000004HIE-3F4V;
	Tue, 08 Apr 2025 13:55:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28t4-00000004B84-3CbX
	for kvm-riscv@bombadil.infradead.org;
	Tue, 08 Apr 2025 13:21:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hwsED9xLZcHWSWQwNeYdiP1D76YEuoP7ff0R7pjjcro=; b=E/BGW/UVWUu/ZnZpwuf3Ad8VqV
	u1qEXlyR63gqARwLaMOHW0RCv95sE2D2QioZMxF4q6yIyLFhk7bKYeAll9o6DEDXc86qoYmZBXFMO
	GHbm/h7jvYDnp5MBFMVek6R6QStZKeRySWxUDpaEKiIuP7dppJn0p4oEgHPFsj+M9g0RB+yrtocb5
	0uWhwE5irfwe3UC1caruibQPOGOKFqwvfC6ZQLJTjqv7A7lFBzm7lZQBsfCCHLuYU7+Toi9Jgir8k
	PxHPTBXtlNvwyWY75bZ2gi/LIBrPcdIfk6n+O8bsrSjAIBfRPAeMDCC+KrYehIb+8Av0fqpYemxBU
	STUcRK3g==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28t1-00000008JDR-3mI7
	for kvm-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 13:21:09 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso60654365e9.3
        for <kvm-riscv@lists.infradead.org>; Tue, 08 Apr 2025 06:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744118465; x=1744723265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwsED9xLZcHWSWQwNeYdiP1D76YEuoP7ff0R7pjjcro=;
        b=jA8YCR/Mg14l4/Yuj1/3hmRlwLzdnqpRN0qG0Tb91Hgx2IMBclwiyKVVILRmhGIaBw
         DcdHn+DnJWxr0JgpMsjrnICyxBBle5FQuoCPih2jcGKXLz1szN1Gw7x9cQ8SySgkb6E7
         uCK5orWfyeJtR/7aaxhZ2qHHoKkE+BNsjUaXjTNNEtR2Bu60m1SYZRsMzmX8yrLOxISw
         yzSo1d/tSSyhrFdZR+C1GsedkCpm705GkXZttOLvhEoVoKnSjtEYr0HOc6K01RDMbzl2
         NJGg7+S/fwU5Q+QXD0nLY2U15swcT8fIzwgiq6xmKa59xBxtqwExaiNQvXmpio5FQenJ
         CVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744118465; x=1744723265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hwsED9xLZcHWSWQwNeYdiP1D76YEuoP7ff0R7pjjcro=;
        b=s/mneg+wZFxrJg9+F09gwNR381BzIOjowmZVNxBUgmgL016RXglCS6PpvYtR8xBbjr
         WnVW+bRy0LI2dcwPupTvWrFNww0P/xH9S3LLM8iveukK4cN2bWeoCvWZJJEdjHtKxQKY
         5vxL8PhJCkbxGHsXCzlDT94CIJwu1C5WensS4gIDwdLfIz4JOIRngH6cqPAbUG/fOduO
         xZI8zKm09cNGSoNxTIvlwYMqfRL74NYfN+EkDTkTfDllcpVzdmeP51FQxLNCljBaFPD7
         ZNm6v9CBNSfIe6BXxZy32s4S2aYOnKwLns1J63M4eDim5Cu74qKFVfBqkgXA+IvtEXxz
         Yqfw==
X-Forwarded-Encrypted: i=1; AJvYcCWl+9oPb6XDOv0HgS6VwysSrNPCMRxHO4MiqOdij87HB+gjIk4KFp0I30U5pv3GwdoB0aHW0rBQI+0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyow9GZ7m7lJNz8+iVklo6Zv2OwfDCOVW9+EajxMwlISgpoO1ga
	PKUAxVwYzTFT6/zTMDoeSAhtWwT4PNXtXiZwCsTgtgnWOdG9CxSM8XColrVXhEU=
X-Gm-Gg: ASbGncvk8fedkyJ8ybGe02nsXqc1vfjnIO6CDYCYYb02ZmXv/qDBTWxTpI3aV+FUhQ/
	Fot8mvMMEixPfw6Qjzz2pEHKNnfCbIzvleDXb4zbBGQDuK4y5jWuBASJUxK8c+oUEWJ+I3KPThc
	zPkdupSHWU1IFbelDL58PzPKdW5XaAkSUp+0xSmipqSiubR7zWRly0hDjj+65dU5cJ0Fr1hpjt+
	RBzgFpRPJM5uC/MH2Iq9ukt5pLyuvTweSyCBfZ16R4DDxFYiHq666T8FpzKxc2TouXK9bMWTUm/
	mUllAHd4GqMQKfFy/O7jx0HXTAqhiYt9jYA627eZkqoMmJj8h8wA280p9sI8BUU=
X-Google-Smtp-Source: AGHT+IHZICYsUrjLH4YNZEOnxXpyTAQfzZP4OUy8xi2eNeiSzDjWYngsdEatS4fdZh+4tPkiN92iUw==
X-Received: by 2002:a05:600c:3d98:b0:43c:f81d:f with SMTP id 5b1f17b1804b1-43ed0bf62eemr158443455e9.8.1744118465399;
        Tue, 08 Apr 2025 06:21:05 -0700 (PDT)
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec36699e0sm162159705e9.35.2025.04.08.06.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 06:21:05 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: andrew.jones@linux.dev,
	alexandru.elisei@arm.com
Cc: eric.auger@redhat.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	vladimir.murzin@arm.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [kvm-unit-tests PATCH v4 5/5] arm64: Use -cpu max as the default for TCG
Date: Tue,  8 Apr 2025 14:20:54 +0100
Message-ID: <20250408132053.2397018-7-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408132053.2397018-2-jean-philippe@linaro.org>
References: <20250408132053.2397018-2-jean-philippe@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_142108_025002_DE9C9577 
X-CRM114-Status: UNSURE (   9.16  )
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

In order to test all the latest features, default to "max" as the QEMU
CPU type on arm64. Leave the default 32-bit CPU as cortex-a15, because
that allows running the 32-bit tests with both qemu-system-arm, and with
qemu-system-aarch64 whose default "max" CPU doesn't boot in 32-bit mode.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 configure | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/configure b/configure
index 63367bbc..20bf5042 100755
--- a/configure
+++ b/configure
@@ -32,10 +32,7 @@ function get_default_qemu_cpu()
     "arm")
         echo "cortex-a15"
         ;;
-    "arm64")
-        echo "cortex-a57"
-        ;;
-    "riscv32" | "riscv64")
+    "arm64" | "riscv32" | "riscv64")
         echo "max"
         ;;
     esac
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
