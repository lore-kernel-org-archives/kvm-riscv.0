Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5CBC369A2
	for <kvm-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 13:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KDgHd/WVAlhXlfn+a+DABxsp9ribX82GBOa8k/zRpYU=; b=xDbN2rLc09mJxr
	+alNeSQ424d4Ss+v5J0HUTFk7mVugdUoZwj5PKDdins0RhTLcAJpWvS5WStnzV8IbC7B4RxG5bUwg
	fDmqui5TOQmxzAdnKzpwW7Y+xVBW+xxnkfwll6iJeWlKmgB1Z+b5FeJx1HgkiqZ+m20w8DpMoP75v
	dxhHklASuV9jXEAhHdcAZrWsUXDgFFk3qfgDR8V3As4uJgZqd24PUJFUt910SVcsvQoKTCCqWqXEi
	80KswsDnvp00qqhwdLEc/AnwWuk8C3uf+fc7I0kwj3rb6EvMGQRehE7G3KQ6pHj8usAF1kjvPd22K
	Ww1bU2/O8L+D9N0ZFbVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29QF-00000004HGX-1wIW;
	Tue, 08 Apr 2025 13:55:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28t2-00000004B78-0LKQ
	for kvm-riscv@bombadil.infradead.org;
	Tue, 08 Apr 2025 13:21:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=SRH4HHKjDjKZC1O9fqzVBp1Dw5VmTF9lQVHJ5oF2lVI=; b=pO9rDruSgTL+0rlsiKl5BbVWz3
	XLFIK9qyKz7rXz5NLovfHICkOE937WFSApouTCekeiKttsTb+KT8Z07VVG8bo6MI6YABodSxZANou
	eihauCfdCPCCN+ONgbZHyE6waQ30Lox5naczWRE8FqX4fCmxW71IUtHvqcPc5kUjBNM2an1VZvz4u
	EVxZrA9UMyr6UmaE3VPLWORCyrk2tfa+ItGh+KMGHLypYZmC6apRq+vtv21DIqVPlLPiOdZK8Kx8S
	ht0S62nESW9a9Szwi7cV7NZJQFtNqpVg6O45CYq98JpmLpD+hsG3xS80T2AaluYKybpoI/BDT0/p/
	xkj7jCng==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28sy-00000008JCh-3IMk
	for kvm-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 13:21:07 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so36077045e9.1
        for <kvm-riscv@lists.infradead.org>; Tue, 08 Apr 2025 06:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744118463; x=1744723263; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRH4HHKjDjKZC1O9fqzVBp1Dw5VmTF9lQVHJ5oF2lVI=;
        b=boUl/oSB0KZKuRuKys6czxeeHHAehEmxl86oYBEYeX2ADMAzH8MxrSuehzYF4wig2I
         hX6FJdSGK99kAjJBs6+rkifGAo1qYfBPD6RtYT0/FUP9lPgiuUWm5+H0ZVfgy/AYYs3r
         MDMdkENtq6i4P0flQzA4CGNFQdPJeWjkxO5jU/bCQI9AivmzP5a5tI7QVRiIzLhdipxL
         YFvv9Po8TovaSXoqyTRKbuEn7AAyXAcSLzWvYtlLYrD1avfPmIeSorbqSzjrLi1gYGBe
         AUtuBpFeU4AUJFxeGoWtr4ALTysP1qaWrLpUVd5ls5i807fGIt+OdDvh7yVNh+Vc5I52
         6R5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744118463; x=1744723263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SRH4HHKjDjKZC1O9fqzVBp1Dw5VmTF9lQVHJ5oF2lVI=;
        b=EHuFZ7vzDbnlx8L3BDL5GHlT07KXOgbMRf2B7dDAoNjQ6wkN+uS+SNPafF6tUWBEk1
         fE823um+QunC5ZEODOQ8dTfO1P136KvWCWznks/xcKR2HCymMnEivYxlQpyVqZjQ7P+Q
         chEs0SG+9l5YWUE2Dyre4Mc+B5Gqk7evekq7HlCkMTAYe8CiJTMJTGFqqjfY1/dQociI
         8+TXqOEE+OOvQoJZxEKFUSO3pKQ/CsJMC3n5p8nFurWz2TE6KDfDe+lhXT3Tr4KA7WAL
         X89rSDSb6nwGKHIbzpuMrn+ASCGYb6jdIH59h5cy68xs/zFXinHkBsI6OOX5bTHEHjJ/
         9COw==
X-Forwarded-Encrypted: i=1; AJvYcCXStxxRVjEjY4MbsC248xJ5Mu7Vl196if57QHR91dROwHQjqZxApGnieBtqO12hSnleWRfPicZA/9A=@lists.infradead.org
X-Gm-Message-State: AOJu0YyeLMzZ/CXN1iV8TrsYTX3wfOICS+V/FRZOoPkISQeSTF5BT9Ao
	qx9ZYxqLWJMX8cTdqzrLFSLoRCp2IAFTxcCF9MufwvKbSd2G0zXRLT4n9Bt45hU=
X-Gm-Gg: ASbGncskRWR7r/fBV1rQQOpCfvk55G7ke73VUN1nlfxb9dqO7lpYi5KMWi3aishXtfv
	xnvyaPerhd2wKy4UhgCcuIxj61TtJrG6SScOGKZc+7oWaZU+HFvrH1IfUREVfd9mPrAE2hrDn/o
	6lS6hhSF/oMNlWPOfF61jkPwkh54duIXCkuAYDaf7m7pd9celvAqJgwPSPazm1sBnzVWV7ppXV+
	PEusW+UbXQgEHRIgh8E55h6jt6AhaZGUE4YrCGUotk1OUAYAtlZtuj3UxEoGpACYdnaTyiYJ1LH
	GStxdq2dxay7Eg6bdfE9pp98Ut4BqJwNYs6qCXgEbEwccfK6wygE7hGvw8jZvDuCM3xAIe1dxA=
	=
X-Google-Smtp-Source: AGHT+IGXvBRS2ISmkSgOkaf9NDWmbD8mKXwPO0SBtc5D+QUv2VkxB2qWcK8BGtwXEr2R0/0t367Gpg==
X-Received: by 2002:a05:600c:4e0e:b0:43c:fda5:41e9 with SMTP id 5b1f17b1804b1-43ed0da5960mr184760875e9.31.1744118462693;
        Tue, 08 Apr 2025 06:21:02 -0700 (PDT)
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec36699e0sm162159705e9.35.2025.04.08.06.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 06:21:02 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: andrew.jones@linux.dev,
	alexandru.elisei@arm.com
Cc: eric.auger@redhat.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	vladimir.murzin@arm.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [kvm-unit-tests PATCH v4 1/5] configure: arm64: Don't display 'aarch64' as the default architecture
Date: Tue,  8 Apr 2025 14:20:50 +0100
Message-ID: <20250408132053.2397018-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408132053.2397018-2-jean-philippe@linaro.org>
References: <20250408132053.2397018-2-jean-philippe@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_142104_997049_6FD740E1 
X-CRM114-Status: GOOD (  10.17  )
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

The help text for --arch changes from:

   --arch=ARCH            architecture to compile for (aarch64). ARCH can be one of:
                           arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64

to:

    --arch=ARCH            architecture to compile for (arm64). ARCH can be one of:
                           arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index 52904d3a..010c68ff 100755
--- a/configure
+++ b/configure
@@ -43,6 +43,7 @@ else
 fi
 
 usage() {
+    [ "$arch" = "aarch64" ] && arch="arm64"
     cat <<-EOF
 	Usage: $0 [options]
 
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
