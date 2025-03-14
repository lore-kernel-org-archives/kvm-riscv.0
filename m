Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37AB4C35FF3
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 15:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PbWgiooI4xQofeVK7QeTMB1EP6CYWo6n1JuNQH3RfA8=; b=EMYY2lwNNvVjjb
	3MT7mQIyO1kyvgq1FNtPwZ5vQz5QK0KHCZDLoxgOqlxzilE6Z0ONDakdxO+H64AAlONwmkpE9xH7G
	llj6zYEMgd9CeqHrHd4ovAFTlZEvucUfXcQluEV/JZ3597h3g+Gn8lSYcSTZQn8zpJBuFgFBfsAUb
	WDXAEmlcdAtePe0wWair170SW6x3w/H5wt84Nw/FqLZFOOMPzDRAk5vLe+dP5//CE0z9zUt4GGu5u
	mG/wFnSPK0JAQSuwLRIkpOJSPyDWkXo7gGlSZDTYfTnonIfBdf6PS51yrVMo7T9iyPxVD0g/vbIZR
	QoD9V9SbgZ/EnLuLZpHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7Kn-0000000EdCA-3zHd;
	Fri, 14 Mar 2025 15:52:29 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7Jd-0000000Ecwp-0VLB
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 15:51:18 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso15811665e9.1
        for <kvm-riscv@lists.infradead.org>; Fri, 14 Mar 2025 08:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741967475; x=1742572275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgQ0Ki7S7zg6nzRN4ZWX4z5ZVEFjxmGZvTrquNKZxZU=;
        b=GAJbcfFrA5L0ccw4OREWCacxnSBhu8RV84jUGXcocC3s7FiijEFtcKjz5nxmCIgQ+K
         +ilt5JdAJKSzQLrp68SQbnx3uVRHTLdHcSIUFjarPHo+1cEN1G5qQg0rB45l4md9SzVz
         lMY8Yh9eMR1grocvrSgV8+wsqQnqzZm3p3/hWWpR8GoKyKVdrr8jqXG3kEcBlpmUuk/n
         GLOS/I9nEm0JwDaC47o/JTgkokCydLtoXsy7UPAqrvVaYOFOlR7PMOJUXhElhyuiDYJp
         tUUL9uq5gILeVH3PUr4F+CENpOzLoSr3j54INT98Mz3dNv6jdVYn/KjIJWMzMcMBB7A9
         /VEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741967475; x=1742572275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZgQ0Ki7S7zg6nzRN4ZWX4z5ZVEFjxmGZvTrquNKZxZU=;
        b=nL+lO2u8ZSfynHHcdH2POrwhedw3MuzfevngxoT/M0mfMPMBTmAt4O97B9sJUGyAhx
         dRHTpP1Nm+Os/Yw0KdXv+OxRnuXNQWZDX+VTQVu2qCIQqx8M+GjH2WC2Ma/BHbX8TiB9
         sJh2TbVdlIEBY3NOeW/IzlsvsvP7J8O2c3qmnJj5Frb89GCs3GvdmgO9HoC54C2ydeIb
         oHnXvGEFp9hT60BIxV7oNn82TKKqwAjOZQS/gnomjX4wYmYanx8qeRPHXjD/TLCWtcs8
         9y2fbTFJzwIQaCDjJOXUOx65Q/SDkoZQEWZso6fyJ3dRe+u8q8FCJyd+sxq+CAoSZ44o
         rkqg==
X-Forwarded-Encrypted: i=1; AJvYcCWISR1q5KMQuXeaQLNJxqRdHO39+W5Cv8TdUiszy6NzbE7TGIT3wnrW0gxoFBVhaWIESvoMbSg5p3w=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2+wZDkseiCs/5ve20VF8vBbYEwjyDaGlfnBxji7MlgAjyT+Jc
	WUNOoSTK6EAHboKBpF05FLKrK19o7u2W4GERgzuT8wIQ1VdXDDRiPmvwUWvtxjs=
X-Gm-Gg: ASbGnct4ldAvlagxoVfWtmJOcg4QlWVJ/+2QKBnB+ircMQR7TiBX+Sr/HGrDsPcXBp1
	uc3I0Rcc+NvD9ff9RGM5wj+vV23AhZwv2hrSZwGBX/HUULCmZoPoYD4SQvS6i+OBZVQwTTPioaR
	YYVcx8RxJhx41+D4JONbYhA17z3XkAM3cxugQ1WAqJ8zio/YcTtZ4RbPUFg2pt2A0ULaaMbrlGJ
	1CEwBBR68zQFCdo+Lr2uVaeDZj+iXhP4NxhAh2zk1bdR7DOgzM6kBi4p5oclC+65iEi6ETyykdw
	ey07WqPoYKZUeqDtHYVdTGSnD07HzcJ2Y2Fp/q41NfYEbjHr6shGVsXsq9dFCIA=
X-Google-Smtp-Source: AGHT+IFLNDlpPyRHd7THTJueCfShHv+cshQugLdnBwo9BUmrTvt7xn9ewfp+VyqjXp3lJ+1TO4LSpQ==
X-Received: by 2002:a05:600c:3ba6:b0:43c:eea9:f45d with SMTP id 5b1f17b1804b1-43d1eccbba1mr38605875e9.18.1741967475088;
        Fri, 14 Mar 2025 08:51:15 -0700 (PDT)
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d21d67819sm15249945e9.21.2025.03.14.08.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:51:14 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: andrew.jones@linux.dev,
	alexandru.elisei@arm.com
Cc: eric.auger@redhat.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	vladimir.murzin@arm.com
Subject: [kvm-unit-tests PATCH v2 1/5] configure: arm64: Don't display 'aarch64' as the default architecture
Date: Fri, 14 Mar 2025 15:49:01 +0000
Message-ID: <20250314154904.3946484-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314154904.3946484-2-jean-philippe@linaro.org>
References: <20250314154904.3946484-2-jean-philippe@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_085117_158879_B3FAB39B 
X-CRM114-Status: GOOD (  11.65  )
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

From: Alexandru Elisei <alexandru.elisei@arm.com>

--arch=aarch64, intentional or not, has been supported since the initial
arm64 support, commit 39ac3f8494be ("arm64: initial drop"). However,
"aarch64" does not show up in the list of supported architectures, but
it's displayed as the default architecture if doing ./configure --help
on an arm64 machine.

Keep everything consistent and make sure that the default value for
$arch is "arm64", but still allow --arch=aarch64, in case they are users
that use this configuration for kvm-unit-tests.

The help text for --arch changes from:

   --arch=ARCH            architecture to compile for (aarch64). ARCH can be one of:
                           arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64

to:

    --arch=ARCH            architecture to compile for (arm64). ARCH can be one of:
                           arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 configure | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 06532a89..dc3413fc 100755
--- a/configure
+++ b/configure
@@ -15,8 +15,9 @@ objdump=objdump
 readelf=readelf
 ar=ar
 addr2line=addr2line
-arch=$(uname -m | sed -e 's/i.86/i386/;s/arm64/aarch64/;s/arm.*/arm/;s/ppc64.*/ppc64/')
-host=$arch
+host=$(uname -m | sed -e 's/i.86/i386/;s/arm64/aarch64/;s/arm.*/arm/;s/ppc64.*/ppc64/')
+arch=$host
+[ "$arch" = "aarch64" ] && arch="arm64"
 cross_prefix=
 endian=""
 pretty_print_stacks=yes
-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
