Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31365C3600E
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 16:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mDPdCZLwjfVeN0ESI7PZuVfL8GMFjwJF3d5ijuJFaf4=; b=RWtrTXxJVyNuse
	obrU3JY+hyXfe7be4P/KzlsAicLQs8dD82cRowtM5LSRSjNgw/iX7I8wamae0y15kFkuGCi1t4uND
	JNEtO2r8IBM+CeBvHxurz0OSIDWWN199VerZIgUoZYtJyqKWbC6eFVBC6nFBHcz6Zr2GRchKAqx5o
	nu0H2FiRs+Ga8MDcke3+0OzKjBf5EC15Sz4TX544qpga/OmqbDQNQYXVhE7CzSVond6jqMQxpTqMC
	Z2PgCqL6vZuN1ss1bZU1UDKb7ddhgOY8nNOSjT0b/uxDqWKzGtj2NIwLueOfcAldJVKAzZDAiLybZ
	cq+QuMSXJyPOGcLVv/Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6yu-00000006SVw-40mF;
	Tue, 25 Mar 2025 16:18:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6on-00000006QwP-3RLE
	for kvm-riscv@bombadil.infradead.org;
	Tue, 25 Mar 2025 16:07:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fK2tkGsZN3Ahq6Hp1U78FfDDer2UDSH1+xmbDUmwofs=; b=cERjmiAL6xwlgqjY7IPCwX88iu
	gZL3rBEfxwp2VFGP+aLWnb9iKyDhrYS3uOT8JTSS8+KFNs2VvTEEnfo1/LmiWoDsx3h3H4zsDLM7X
	96zo6Of7BLx0a0yCneBIht4MQEXxqBPzS236I9/F64dC1MqQaPwJJ44ykwwLnrJvKs6YQ0IHw5RNN
	DHIrvqTyfdjnpeFnjESYC8/qJF52dxtxwWRTrQP+VKHoTcNZZ1kXPfz4MPyLT1aXc5JnrPj4G3gB2
	KHsHbq0i5/6czJ31GE0tQOjIXiZu8Ea2AcbuvvRtL3rFL/UqCx/vvV+7Ff9gSfdbdwDzPH9vJTp33
	4SjSkDaQ==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6ok-00000005daK-3i5Q
	for kvm-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 16:07:56 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso39524205e9.0
        for <kvm-riscv@lists.infradead.org>; Tue, 25 Mar 2025 09:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742918872; x=1743523672; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fK2tkGsZN3Ahq6Hp1U78FfDDer2UDSH1+xmbDUmwofs=;
        b=Ia2RX/J5Fs3KgtuiZLfwS73MdHxL3jjDFu6ltc/zg36JFtxrTabcXUAKEdvvgas6Ap
         ZHqPzq5oR9cLO63VTnOporKB9Y8DQnjk8zFcFHdA/JQ4dig5jGzu1NN8JsoX/OAHLxxy
         qp/ssdIqvjb/AOdJg/wZlujcuA86GvSf7rfZ9OBwEjaFQ3ohtlEzSkVFTh1jb13Du44r
         5eCQDBnV+P+gQmrQtYbikzHkuaybw6dYearmR6thFsleAAy284fuFEsjFThCNWmz0W28
         pqm4Tf3rrY/F0Ir0x5Ir1z6MynPQmE3vMGzdU3YrqSyLEwcUtOi61qEeYdHzOPHh/+t+
         DTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742918872; x=1743523672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fK2tkGsZN3Ahq6Hp1U78FfDDer2UDSH1+xmbDUmwofs=;
        b=sOe9UmH2R3u/uQrnoYa+R8qsHezdaJl9JDNkoOgkyKQa1M+Cmquzu2y/8A63pKKyfZ
         poqt/pSKWEb193xxO8qE36GcYY/sx1RomTfCi/SulMxngS4AS5PbBFZO2vS5ShW9xOTR
         rugzFGK4J1vzo6gT6Bw1GEVtuBx+LXKDaxwoyQ5lez3XfFjfvg9B+AF+l9LB24jdsWwn
         /zoruvKsH+Dd9xymkKJvo+z9O7qD7Nxw7qvHNa8ROOQhyv9c+I/eb5Meo3PXjbc8Uit5
         R2PE4FiBIo8GohBgmYULQ/9YopjKxjunXL8Ma8uyP4U5kI+APHhtLnM2eDP5FSGT7u+i
         urRA==
X-Forwarded-Encrypted: i=1; AJvYcCULI5hDDt8M4SR0UPsAwwRoQenHKA4QRvgvexAiJuHJ6/0xUAS7RVBl7q/qbsaDaaOMIuvJ0qi1eTU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyEiBg40yBsAe3lrovoW7dx1qtcWACeBBZiVDGuB+uk5Jyc1Ud+
	EMYSssAa5HMyDCZDN7X6y20/u3GXNhos5YfPf6Ja4grtbodlWLX2Kjtvu7EybR0=
X-Gm-Gg: ASbGncvVVv4ngZpOiuayeE1ZKcx5KQjUi6oXItWI+J0SfuQbGpspEkTWy8vSKLfOuxb
	PzyE9nbhnyTGPLhXD7cSxqk56x1k/xjNSU6rS0wIysicMxfrNbK+FD6k30cvYLj77pbGBkHYp/u
	LT/q+Bokq0+cCuy4JM/BnUv9HQCegg79R/LaA93dfug+EFpX6c4aTyoR6bhcdKFRkQDrzdrlOCS
	a/6j98Dj3gRGHPjoGpcojbd2a++sNspuPL1OEtRXCErcukKNXYQQ9nZ0jSjRr2v4m9dJts5GWFq
	GMNJIghPwFqv8czUlwFAHcQP4XAJn/bIPYaRauu9Rkbu6DeiCEfLWTVigIdZSelqoCjv/+4jzQ=
	=
X-Google-Smtp-Source: AGHT+IGMPJ/vzfbmk0M4EXxA8yEhXdjHJu8uBAqrg18jftKydcKcsI8JHQeO/UcY0KzF+hRvMYRRpA==
X-Received: by 2002:a05:600c:1e8d:b0:43d:a90:9f1 with SMTP id 5b1f17b1804b1-43d509e64ccmr178534705e9.6.1742918870382;
        Tue, 25 Mar 2025 09:07:50 -0700 (PDT)
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f43cbasm203972195e9.9.2025.03.25.09.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 09:07:50 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: andrew.jones@linux.dev,
	alexandru.elisei@arm.com
Cc: eric.auger@redhat.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	vladimir.murzin@arm.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [kvm-unit-tests PATCH v3 1/5] configure: arm64: Don't display 'aarch64' as the default architecture
Date: Tue, 25 Mar 2025 16:00:29 +0000
Message-ID: <20250325160031.2390504-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325160031.2390504-3-jean-philippe@linaro.org>
References: <20250325160031.2390504-3-jean-philippe@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_160755_038764_EC5B7010 
X-CRM114-Status: GOOD (  11.50  )
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
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
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
