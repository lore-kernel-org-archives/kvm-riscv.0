Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57F3C35FF5
	for <kvm-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 15:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KPdB1VhAsiXbbPR+t1Yq84MpCEWdFM1rCTuOwpquJIk=; b=nF+MTSK1ETbSB+
	GZs3QFnmPwNB/ymYXwVEfFKHvSyMLY750iBBA4kP0ejv563jnr43TgPwp2BT/u8agghA55bsgXUct
	XNZqQh69aW6YjPhyA8BPDEN2ZM1sR/S+d4yP+ojrEjGlxXvZmSz7wCz968+3n2+NKXSEYb0tc06Ai
	/uNEMzL7sLRkG2FYAFgrUepWXgGzN7vzdKQU7FwA8zK+Kv07yFHfyqhTdr4YgfuAlrCXdJA9dur49
	a2DCEPPlhmZSNCNvfj6ltqv9hLIbAdgEqb6/fGp6qFTIyy742IHpzP3eLsvb7TLahr2RSajPGGs58
	kip2CObxzmj3byXrpRyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfLv-00000003FyQ-1MMG;
	Mon, 10 Mar 2025 15:47:39 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treoz-000000037hR-3NYx
	for kvm-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 15:13:39 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-22185cddbffso95835295ad.1
        for <kvm-riscv@lists.infradead.org>; Mon, 10 Mar 2025 08:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741619617; x=1742224417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Radg/O1kYDcS8p0IZNGBH2Vna601zEl7dWErY3x7IKQ=;
        b=3dKN2OS+oWMOrOnfzgSOtxAz2g+QzJYOWD0mnujyBvxyTNSnsmc4l1/GRbvms8tXYs
         LVRnfZ8cTL2p7ycdX4KnHk+ohxJkX2Ut0AxRwCvrUqZktiVwFsrZrqT/flIaUa13A3x4
         D7uEi/rYn/nMQdt+CUIMVF7eZn9ro29qEn0CO2rhh1deaEhST7aN/1bBErST6dy98160
         8otTS2GuMz+gKpj3yeSeYnj31ONWsEiIF4nykp1cRu8zjYeR8/SV/4xn76OOcCJsGN1Q
         OVG1NsjKvGYfTD3Dun/ZOvWHmE0qH6eAvSEeQxoWvLiVUUZF536BVQY3OxC/nujmh3nd
         VO2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619617; x=1742224417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Radg/O1kYDcS8p0IZNGBH2Vna601zEl7dWErY3x7IKQ=;
        b=LTsn4DXG7FvUk8nEdlA/kEmrCazl2OeiDvqYmXIEDgRdfRRqmEfhoRR0+wOgUoAMEc
         NNnJSdSbxYrMim5k72Ef9oVTGJXxDUX3zFrpC75BJo960Hq64PLovtQ2fbIqUCax7d1B
         BlejEFHKN7wB1eGLcsZ7lPHyC9ec4zHbbBUdgFdaXnOCnyxbLWS2CG/PbZxfehXVNksJ
         FiPCfaFuBBBnKr6LiYwfRttlBc1huTS5BfGwUxPcLtbgB8Em/67906tGdU7gQ8nZGtx9
         BNfxKgcCfqJWtAxcbDDjyU9G8S1asE/6dhP+vIvv6LXkwGcoIKr5si1Tx1qh25uSpAme
         aLYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXf4VlBMMbVM5OMfhf7QM1Pui9y6+1ShKhTPWCkE2aILB28pttQauGIt/HCpz+iKWA+140OIExefzI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwwpNRLUx3LnKk+HWXF2DgQctdasExgN7x2gldEa87HL8lcrk6N
	RcazPGBJVs6DL3LIKJrH7qmUCyKVZbklMhIlYbHQWyrwnXtuK5JWiIgFG83yu0w=
X-Gm-Gg: ASbGncsdJUTZGvsCKFn6vAH19T+Q2i5ijOwqC1fAPy4WeAqiQaYxoopwrJDrmq/Whcd
	pjzKIS77u/pkD+OIrw06u465viLSOlAOx2BB3PBRbgbLvYoO2qm4dqkoFu4D7kvLh9vlrTYbG0p
	83ojY9Kf/omQarJSRYPXVvOie1CZ7wQ6abv1Qrw9gcyIZuXuZTietAzrhpxRg7Zn7FZnByLgW1A
	snYrZ6gdTlPZHZE0/QilOFpa6PSlnSTA+TVn4s6qU/bLlz3f0+ccZVD3wFird+1tmT5lp6a0TL9
	HZOXsGNa+sM8mRX1NKxeFo5hcaEwgpXuf8LreW+RmeRSjQ==
X-Google-Smtp-Source: AGHT+IFYtJx1zpZXoyRZ/KHJTP5G1HNeErNj7hP1Uj5JhhNtVjlp1IKO2nyoOwTegiQflbbotJG7Sw==
X-Received: by 2002:a17:903:2308:b0:215:58be:334e with SMTP id d9443c01a7336-224628603d2mr147459315ad.10.1741619617154;
        Mon, 10 Mar 2025 08:13:37 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm79230515ad.91.2025.03.10.08.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:13:36 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 06/17] riscv: misaligned: use correct CONFIG_ ifdef for misaligned_access_speed
Date: Mon, 10 Mar 2025 16:12:13 +0100
Message-ID: <20250310151229.2365992-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310151229.2365992-1-cleger@rivosinc.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_081337_850850_7D00FBE4 
X-CRM114-Status: GOOD (  10.87  )
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

bWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQgaXMgZGVmaW5lZCB1bmRlciBDT05GSUdfUklTQ1ZfU0NB
TEFSX01JU0FMSUdORUQKYnV0IHdhcyB1c2VkIHVuZGVyIENPTkZJR19SSVNDVl9QUk9CRV9VTkFM
SUdORURfQUNDRVNTLiBGaXggdGhhdCBieQp1c2luZyB0aGUgY29ycmVjdCBjb25maWcgb3B0aW9u
LgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgot
LS0KIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBz
X21pc2FsaWduZWQuYwppbmRleCBmZmFjNDI0ZmFhODguLjdmZTI1YWRmMjUzOSAxMDA2NDQKLS0t
IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCisrKyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwpAQCAtMzYyLDcgKzM2Miw3IEBAIHN0YXRpYyBpbnQg
aGFuZGxlX3NjYWxhcl9taXNhbGlnbmVkX2xvYWQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCiAKIAlw
ZXJmX3N3X2V2ZW50KFBFUkZfQ09VTlRfU1dfQUxJR05NRU5UX0ZBVUxUUywgMSwgcmVncywgYWRk
cik7CiAKLSNpZmRlZiBDT05GSUdfUklTQ1ZfUFJPQkVfVU5BTElHTkVEX0FDQ0VTUworI2lmZGVm
IENPTkZJR19SSVNDVl9TQ0FMQVJfTUlTQUxJR05FRAogCSp0aGlzX2NwdV9wdHIoJm1pc2FsaWdu
ZWRfYWNjZXNzX3NwZWVkKSA9IFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9TQ0FMQVJfRU1VTEFU
RUQ7CiAjZW5kaWYKIAotLSAKMi40Ny4yCgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3Zt
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
