Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36528C35FFA
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 10:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N/SFn797h28uEQataGubX8rOW6LNUld6Y98CAayfA0c=; b=jPkA/iqiwanEj0
	IUJzzH4+BSInsbelVsacfCudKbq1TH3eHWcugTdOj7F8n0CDoiiCdJf5Q1tjSIJ4yJo8mPhdhfN8f
	RkFi+7JIHDNAtoQiaxDBJkVbD5vRU8C7P8Jbu58Pn+H+a66kkZa+D2/pt9Nu69FcWkXar5AjTI4vN
	wyPtl1NlTopfMiDzZdVnj7PcU3wu+Xn+889PdcvecTpuQVvW0ArDAp/1KIy5RYIVo5FsCWt0hj83O
	j4O4KcmlTV7PPtzO3XaKGzHt+DBe2Vc8srChg9CahWk5uCUC3WxHJEHJiYk0I+JW/4Q3UHFZMWXv/
	HkRdVH8xP/itfnkGVfUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7gE-000000028vO-43Jt;
	Mon, 17 Mar 2025 10:26:46 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7Zt-000000026yK-2goI
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 10:20:14 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3913b539aabso2621955f8f.2
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Mar 2025 03:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742206812; x=1742811612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gp1/a4HJMNi1Mi5InH5hHHDY+xPb3C4W59LQWScL2LY=;
        b=Lr/3ySelkTlUPYmQ/+XElVGGDBOn/tNUq98HMxZK+vmg19m2tTSDcGH/6NMgRn+7vC
         lPn2q2WptmgNcjDS2w/dG77AMAeZVt38HijMn/8ZeDW0A60MbrJfXPaQ/12BhrAyF59v
         URFiraI96uYeiw5qCm57Ontxl/S5WtsoDUGAIoOPekAokp/qkG/AZfJilr8B4st8gC98
         JGpSqaMxGXAXZBq5qwo/Azfg48NsVkMXanAGTn9pq4pxpL7EP5j3NtVuJPaNbGWu3hbu
         VqNq2z0VMxVH4b9lSBtxC+sJEutbBn3Me9aZd8eDNSGw7eU4EdtX9cRLwdlcaGK4Ooif
         +AkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742206812; x=1742811612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gp1/a4HJMNi1Mi5InH5hHHDY+xPb3C4W59LQWScL2LY=;
        b=ebmiFSE9+GgqDSRDcT2kmHPWag2pb2Vtu/5ELAUeIY8GiT72YZ4MKz3CRGwBF9wFyX
         UN1KrL+fNM0J3nyYvPj+MGhvTtFK05sJ84hgVeCNY/NxwOSNiK7B04WzPUQTShfCh2wE
         AVkkBhJ+v1/K/1jpF8/p3suKPe2IU4u7Eu29C9UUW3Mu/5XPROCnDpfJMZSHFwCQQhma
         dhHlVBhlb6vbrmQeOAlngBxIXFIRQjugtFH/QBQKBH3x9uFO9SR2NDbtTAHfUhaTZvk9
         fHPgQXAo5rs+jxrQfZRNcvHakpEjT2yZopWh6fp+qR/chcS/D2WjqIf+aEnxRNNy+8Fk
         e4Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVsIeGAq1zlvVSsnoglZd/EV3soGpolKlV9F2p0scBzUPMVKTlPmXhVTuhQL6VcEkkUVXaqMKo66V8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyMVKbJPxisM89F/S5PwVAVR1RewMcfgTD7VJOqT444xc/1yPo7
	etiNCNOK1btehnuyHJsiPpcUl5sDFq7cI4pxihtT8EAPGJi8/9aTJmOtqDa8/5w=
X-Gm-Gg: ASbGncvQyXDiM+OCYt4WbX1Yo9/NZuSANmZ//UNIBV+7nvaChr1ZXzBFezfiIgSUQLA
	xo6wMzRHcjb+hMKAl0SPSsEFjLuPljLRShcb7vTy3REAzN9YK+g1Rp89hsI4jgpPt4q8YODPpKK
	28n3QpNE2cVUJ0V5YO8RZRTDCKPFs/MgkABDUfMd4TX1uol17MQiSllsvFkHOgkowugiJARAQ71
	/z1Aop8EjVdN+vvIrA5hadEH1496pOJvWgbzVtkRVgtOJoz9SEbyc3+RH0HzgsPVEwDYsI6ITyi
	zHlthBLIQDsZ5QileAziVB4t/oKV/GdgPIio/F20jsEeHg==
X-Google-Smtp-Source: AGHT+IHWPJvKV9ztMSxyKCQmKirUBG/OWUKVDifeOoh2M0LJzrx61uMnqOH/Bois4cDB3Jj4J2ifnQ==
X-Received: by 2002:adf:a184:0:b0:391:39fc:6664 with SMTP id ffacd0b85a97d-3971ddd8fc0mr9391297f8f.6.1742206811939;
        Mon, 17 Mar 2025 03:20:11 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7ebe3csm14749824f8f.99.2025.03.17.03.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 03:20:11 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <andrew.jones@linux.dev>
Subject: [kvm-unit-tests PATCH v10 2/8] riscv: Set .aux.o files as .PRECIOUS
Date: Mon, 17 Mar 2025 11:19:48 +0100
Message-ID: <20250317101956.526834-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317101956.526834-1-cleger@rivosinc.com>
References: <20250317101956.526834-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_032013_678556_31915760 
X-CRM114-Status: UNSURE (   7.96  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

V2hlbiBjb21waWxpbmcsIHdlIG5lZWQgdG8ga2VlcCAuYXV4Lm8gZmlsZSBvciB0aGV5IHdpbGwg
YmUgcmVtb3ZlZAphZnRlciB0aGUgY29tcGlsYXRpb24gd2hpY2ggbGVhZHMgdG8gZGVwZW5kZW50
IGZpbGVzIHRvIGJlIHJlY29tcGlsZWQuClNldCB0aGVzZSBmaWxlcyBhcyAuUFJFQ0lPVVMgdG8g
a2VlcCB0aGVtLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3Np
bmMuY29tPgpSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxhbmRyZXcuam9uZXNAbGludXguZGV2
PgotLS0KIHJpc2N2L01ha2VmaWxlIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKCmRpZmYgLS1naXQgYS9yaXNjdi9NYWtlZmlsZSBiL3Jpc2N2L01ha2VmaWxlCmluZGV4IDUy
NzE4ZjNmLi5hZTljZjAyYSAxMDA2NDQKLS0tIGEvcmlzY3YvTWFrZWZpbGUKKysrIGIvcmlzY3Yv
TWFrZWZpbGUKQEAgLTkwLDYgKzkwLDcgQEAgQ0ZMQUdTICs9IC1JICQoU1JDRElSKS9saWIgLUkg
JChTUkNESVIpL2xpYi9saWJmZHQgLUkgbGliIC1JICQoU1JDRElSKS9yaXNjdgogYXNtLW9mZnNl
dHMgPSBsaWIvcmlzY3YvYXNtLW9mZnNldHMuaAogaW5jbHVkZSAkKFNSQ0RJUikvc2NyaXB0cy9h
c20tb2Zmc2V0cy5tYWsKIAorLlBSRUNJT1VTOiAlLmF1eC5vCiAlLmF1eC5vOiAkKFNSQ0RJUikv
bGliL2F1eGluZm8uYwogCSQoQ0MpICQoQ0ZMQUdTKSAtYyAtbyAkQCAkPCBcCiAJCS1EUFJPR05B
TUU9XCIkKG5vdGRpciAkKEA6LmF1eC5vPS4kKGV4ZSkpKVwiIC1EQVVYRkxBR1M9JChBVVhGTEFH
UykKLS0gCjIuNDcuMgoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8va3ZtLXJpc2N2Cg==
