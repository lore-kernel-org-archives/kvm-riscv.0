Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4ABFC3DA6D
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 May 2025 11:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DGQRYtVZJaZk8lHoQ68vZvOW4wIYj4Yg+m4X2lU7IKg=; b=QX5c9coVTwuznQ
	Abu0sBpB+YNWRAiPZhgFVH4yQPLjqxEudNWqVajAF+zAN2SnPr/GR/QwqD6GlIu5I+ibQ8k2o/sQB
	ZUVP4pvVWVThES2HyMBqc9JbHd+qZzixFZ4vPpiLKb0SQyQ7aWTyQ1rWQeqgNM+zuw2DM/pFK9c8e
	1jC1b9EoKYXQFGaNDRWXFoOL1hLcAHt9hd/CiOrmxa/5sFqrh1xl9ARAhZReE91+Bcau/1DQNjki9
	eixp1KWHKjzDE+xgEuJAJWWJwwBrbj992W+/urTLrB61DOzGoKGxsOrTXVb5Ue2Mnn7qTWgHHbzDF
	vsT0sCIBncngXZ0S33WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQUq-00000003hMN-1gi4;
	Fri, 23 May 2025 11:23:28 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPWy-00000003ZUI-3mhe
	for kvm-riscv@lists.infradead.org;
	Fri, 23 May 2025 10:21:37 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7399838db7fso691900b3a.0
        for <kvm-riscv@lists.infradead.org>; Fri, 23 May 2025 03:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747995696; x=1748600496; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKzeirrOKR4aa1/jaJ0+BQzqdgTSTiQsfjIovf/XYis=;
        b=RHZ/oSdHOc/56+cTWaMp1d72nw8cguuWg56g21AyKZLw/+q9WZVQpKeljee9x3N6nI
         S5XDqFRH12+vJq0eA688awxOuSo5SgeeDlj7L68lwdvE9jWI+rCkFjnJtcAAADTYjrKA
         QEX+AVtvXbpZNBGcAa2va5eWyHnsuUI5zou/IJNpJutw4CFPzYky8ke/nD5eKdgjZbPa
         nhnN5aJwFaesyv+CPTXoa2PUkppWRLmc5ORPEQBwjFJlUeT0ExWfPfR668HEOtBJD/ou
         Eos8ne3D/GTStGmAuG6ZtLDHBzP7EWLWKLf6q8sTx7Ai0TYL2eqYxOnXpO6TwHMOv0qm
         +jXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995696; x=1748600496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zKzeirrOKR4aa1/jaJ0+BQzqdgTSTiQsfjIovf/XYis=;
        b=m+l9NponVrCSEIFyg0GlpeV5CcOghJrjuBN4R7xdH0Pa+uXlacj36aW3TeCIE0FvX0
         6i+m50VBx8UjsxKZjKYbr0CnScGe/ZuYSRnEE3BeX96JybytPwhGAFNHMWZ31CYQgwlV
         nUCqCqgY9F4ZBnXmLlkEs32TozYFBZdTKH84IB27Iuu09EBK2w+29lU6qdVy9mNWnFca
         2SvPq/Az81nYT3mVXN/eGxWTFV5fR9BBtTvwzXfyWHuVqn54bkxeoO3tsc8ogEpvW1FV
         dxj/iO85Rob8E95TVd7z9ONNRVpUwkyAFaqIizEg41P0MJYbzCpR69m9RgU47dcyAE0y
         lRwg==
X-Forwarded-Encrypted: i=1; AJvYcCV+Jl7jPgtnDE51dqcVgjx0N59x7I/yaTzJu5TEBYm6PSs79ZWu8QAQrk1znT6sxwBoN+TSNEn/bHg=@lists.infradead.org
X-Gm-Message-State: AOJu0YziA7GxnQ7+7JV5M4I7cGhvLATBdkYwRWtSukcbSH0Wk8uePBtc
	HIsVMuimLmcB/J3vl4se4NxSco3gGfmx7PYVFJFuEtBlTgAWVJJKkbcyDfgHxACgg4o=
X-Gm-Gg: ASbGncvuZKPQ82efniseCGQYGRkvht6JOtQrgG23CO8ki2p+8jyOWnMpmhisXQrVy4x
	ysMJwrxfPFE5SAI6u5iW91LNaP/77viw94CW3Qi5Y/C+p3FJ7kIiXChx0dc5mRL2KHrIqzKRRzT
	yDC4CMx94HS738UV1M4e3ZzxkBpDHFthN0X5+qe8mS+xmqhkDyJkPoSTPdmTduqSDoXKuBwTnsM
	+2XEhYsTfVYrcjC8jKrjNOSzYNfmdD/7GfFGDwl6vZELP2Mc7OkEmId2VFByrAPSBAUrj01hEqk
	jSAFvkUQYX7TNxxfK9hmi8tSqLo4CWksjBz2hClg4+Br1TzSQUQq
X-Google-Smtp-Source: AGHT+IFz+/NIX8RZ4CpGdqDvwRIYbmRrE9EGaVbHiy5c0a/czfZB0pteCG9ARelWxW3OVz8OgvVZvw==
X-Received: by 2002:a05:6a00:39a2:b0:736:b400:b58f with SMTP id d2e1a72fcca58-745eccdec15mr4787201b3a.0.1747995696348;
        Fri, 23 May 2025 03:21:36 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829ce8sm12466688b3a.118.2025.05.23.03.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:21:35 -0700 (PDT)
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
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v8 05/14] riscv: sbi: add SBI FWFT extension calls
Date: Fri, 23 May 2025 12:19:22 +0200
Message-ID: <20250523101932.1594077-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523101932.1594077-1-cleger@rivosinc.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_032136_943831_AC33DEC9 
X-CRM114-Status: GOOD (  13.42  )
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

QWRkIEZXRlQgZXh0ZW5zaW9uIGNhbGxzLiBUaGlzIHdpbGwgYmUgcmF0aWZpZWQgaW4gU0JJIFYz
LjAgaGVuY2UsIGl0IGlzCnByb3ZpZGVkIGFzIGEgc2VwYXJhdGUgY29tbWl0IHRoYXQgY2FuIGJl
IGxlZnQgb3V0IGlmIG5lZWRlZC4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xl
Z2VyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRh
bmFtaWNyby5jb20+ClJldmlld2VkLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNv
bT4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYyB8IDIwICsrKysrKysrKysrKysrKysrKyst
CiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMK
aW5kZXggODE4ZWZhZmRjOGU5Li41MzgzNmE5MjM1ZTMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yv
a2VybmVsL3NiaS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jCkBAIC0yOTksNiArMjk5
LDggQEAgc3RhdGljIGludCBfX3NiaV9yZmVuY2VfdjAyKGludCBmaWQsIGNvbnN0IHN0cnVjdCBj
cHVtYXNrICpjcHVfbWFzaywKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIGJvb2wgc2JpX2Z3ZnRf
c3VwcG9ydGVkOworCiBzdHJ1Y3QgZndmdF9zZXRfcmVxIHsKIAl1MzIgZmVhdHVyZTsKIAl1bnNp
Z25lZCBsb25nIHZhbHVlOwpAQCAtMzI2LDcgKzMyOCwxNSBAQCBzdGF0aWMgdm9pZCBjcHVfc2Jp
X2Z3ZnRfc2V0KHZvaWQgKmFyZykKICAqLwogaW50IHNiaV9md2Z0X3NldCh1MzIgZmVhdHVyZSwg
dW5zaWduZWQgbG9uZyB2YWx1ZSwgdW5zaWduZWQgbG9uZyBmbGFncykKIHsKLQlyZXR1cm4gLUVP
UE5PVFNVUFA7CisJc3RydWN0IHNiaXJldCByZXQ7CisKKwlpZiAoIXNiaV9md2Z0X3N1cHBvcnRl
ZCkKKwkJcmV0dXJuIC1FT1BOT1RTVVBQOworCisJcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRfRldG
VCwgU0JJX0VYVF9GV0ZUX1NFVCwKKwkJCWZlYXR1cmUsIHZhbHVlLCBmbGFncywgMCwgMCwgMCk7
CisKKwlyZXR1cm4gc2JpX2Vycl9tYXBfbGludXhfZXJybm8ocmV0LmVycm9yKTsKIH0KIAogLyoq
CkBAIC0zNDgsNiArMzU4LDkgQEAgaW50IHNiaV9md2Z0X3NldF9jcHVtYXNrKGNvbnN0IGNwdW1h
c2tfdCAqbWFzaywgdTMyIGZlYXR1cmUsCiAJCS5lcnJvciA9IEFUT01JQ19JTklUKDApLAogCX07
CiAKKwlpZiAoIXNiaV9md2Z0X3N1cHBvcnRlZCkKKwkJcmV0dXJuIC1FT1BOT1RTVVBQOworCiAJ
aWYgKGZlYXR1cmUgJiBTQklfRldGVF9HTE9CQUxfRkVBVFVSRV9CSVQpCiAJCXJldHVybiAtRUlO
VkFMOwogCkBAIC02NzksNiArNjkyLDExIEBAIHZvaWQgX19pbml0IHNiaV9pbml0KHZvaWQpCiAJ
CQlwcl9pbmZvKCJTQkkgREJDTiBleHRlbnNpb24gZGV0ZWN0ZWRcbiIpOwogCQkJc2JpX2RlYnVn
X2NvbnNvbGVfYXZhaWxhYmxlID0gdHJ1ZTsKIAkJfQorCQlpZiAoc2JpX3NwZWNfdmVyc2lvbiA+
PSBzYmlfbWtfdmVyc2lvbigzLCAwKSAmJgorCQkgICAgc2JpX3Byb2JlX2V4dGVuc2lvbihTQklf
RVhUX0ZXRlQpKSB7CisJCQlwcl9pbmZvKCJTQkkgRldGVCBleHRlbnNpb24gZGV0ZWN0ZWRcbiIp
OworCQkJc2JpX2Z3ZnRfc3VwcG9ydGVkID0gdHJ1ZTsKKwkJfQogCX0gZWxzZSB7CiAJCV9fc2Jp
X3NldF90aW1lciA9IF9fc2JpX3NldF90aW1lcl92MDE7CiAJCV9fc2JpX3NlbmRfaXBpCT0gX19z
Ymlfc2VuZF9pcGlfdjAxOwotLSAKMi40OS4wCgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QK
a3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
