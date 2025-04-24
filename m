Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F00DC369AB
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 17:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HZ0CAQpXw72tdRpRfEOBlHB4mN7h88IOzCu8eLeXjy8=; b=TUiTtVCe+hG/kH
	a1ZlnjNmESRXZkcUB3LEZhaGBR85HWTpbriB4mYiriOZsh1D/f/aaV3ZY6d6OhYsAKJjJvAZaHhmv
	sF+cPnYZkM3oQkh3yteODFOcBQRNKxjGtaxP9pg7jEFUrzdn6tdVSpdSHRQw0xn98Df7cUrJStj83
	AwqsFe7AqCqYO8ZCxoViveMou2L9GxzHSlCza0sJPcmv8jWttzhLyT2cbmNTavQ0TJWYvs5Kus881
	Rg4y7HoBjwhpi3l3+H1oHUtLP0YFXZQb9tVtLLNUxmTeYUMnYPwrdSRjFbXDIfhrK7Z8hz44tebHF
	wUbhb/mYApHSEqZAA58A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80Sy-0000000Eug4-1QNL;
	Thu, 24 Apr 2025 17:34:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80Sw-0000000Euea-2or6
	for kvm-riscv@bombadil.infradead.org;
	Thu, 24 Apr 2025 17:34:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3eGkKF9qJdSzcJjZFaybinwNECXrhVepEnvdsnCoIkY=; b=YemZYbd9mtQY+s1WUIt9kSeEaE
	uLdLkfrzsei3hbO9uPHpyOWyFNjLahEhMvChPlq4M92xX7QNRvzBUx6CVFmNAtK/8BjzqlSooqkSQ
	Qa2sG3cyVeEZyeb5RgFZajFkOYGq/AiU353UmXrjE83eWWiAlNdXQNvm4aC3Aa8lEAsYJTMv210Gk
	XHwTTaAh2hN9lLGCibOsRt7RdZygq3Z1ixnazVlNILbbSoykhEFQSAit1UK1PMo6qwTUVASmIMoy9
	Yb+x5E71wfbuSxWJFNjlvBoaYhNaoy5SQCKp0ObWo4S1eVE192yL/WQ5nu/EF1OfqFkTY2tzW2akv
	l9b7EfIg==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u80St-0000000BsD8-3KjB
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 17:34:25 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-22c3407a87aso21265805ad.3
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 10:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745516061; x=1746120861; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3eGkKF9qJdSzcJjZFaybinwNECXrhVepEnvdsnCoIkY=;
        b=KR478FTrmRaeRnjukKBmbQkgjYBV93WAfMSVo0OLc1ilwSO9ouVDMcTYsNJa+ZiY8W
         Ay4lZXcuZVsl8jimBo4a5X4YtAmxpQX9HB9U3NV/6LWMrj0Kn0VfBOGJhBBaD6zdkTd0
         UQegiFt/i00MxOzQ1vBwGzKnaGqiTKvBC69LXmDqF/SXjDrRhhLbyl3ov62m6YUnU+kg
         LrIsni6YGt3L5QmLCkEkxkUmS8l1EuQUD+myMwYOrIf2dsroCTSAwJl5eZhyOkbnCDjA
         STfEQXmJ2YifpNcs/8/NNfbpUHPHIhb+kU2ydKdzRDKQpENHb4H/yfbOF/GYL1ufpzOz
         AGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516061; x=1746120861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3eGkKF9qJdSzcJjZFaybinwNECXrhVepEnvdsnCoIkY=;
        b=MfPdvRzdYNx6dUOD3AFMuGwafTCejroDqQoQy5GPwglmuRveJzRPp6ddq71SU81RQ7
         w71imgLt73RiEpYb6ggIfWdFRr7MknI5CPSpSkKarP/n7VHO3WaOhj1YZTJzRpU69gLn
         CxyE/dRwMu9nbwUvoLjN5cY6lZKFS9u4SHcfHhk9OontnQHTr191znGeBsSPnVlFszFd
         5cU5lXELv1aoQ4hPZiHyMIm7oPxTpRWUkxFcrzFyINFwjqjp19V2fcArRhRWmFUfOdMb
         kVki0GsuVVyHRmFGo7F/yYIEeojKmh4vsll5032LddTZXj+gTQWuzx6/ijjxKnyntmHK
         6p9w==
X-Forwarded-Encrypted: i=1; AJvYcCVo4BrILL+sy7KdmIwy3xMScFZ1kftjQmfWVlqlHa8rWQoKzq9z30yQYg2hWkyCawnQ3bcIL86BB6A=@lists.infradead.org
X-Gm-Message-State: AOJu0YzRsemzzSTLedrSMYQMGq6QqQt1yv4sMBjtDDIOrYJA2d751ZlC
	7QvBYT/K22IjOmuMDtCCmJtruvg/mbKiQDA2ut6QBOaXdvm6Fa4DiZxZO20Wc6U=
X-Gm-Gg: ASbGncuou5Xu07WbkCqFCcmMGxC0YNOb3emL/nNt1HHC5aEnRJdcPmAhoEWEnAoz5Yo
	lKBQbuM+YwscRRLOHTwPcsPDjEOza6zzLE0PLDKR1LxKz9ZKJjoPvcF8b5jnM9ZcygQOpbDZzoK
	A60IDKnQ2JTh0Mhbj5XI+VNot3Gczb9iQSBbEgNT4UcNGPTg1pd9BfGS2WrOre6RjrzFteafkP3
	ohQg20PkQlBRg4p7mM320DwGV3N+0+EVV5+xW+QFvOfJicCOIgDL1KFhQdVAjZq/HW1bNO4Ci9Y
	eJZhAfsucjnUTvS0kubia2FnFfJLMv5dREwfHZvH6Q==
X-Google-Smtp-Source: AGHT+IEs4ew4uugiJtDbQhNEaEfxtdPEFF4bo2T+1eF9T2VcpqRrkFtRa0ffscLhiLfSNXEuYhJu4Q==
X-Received: by 2002:a17:902:db11:b0:223:5a6e:b16 with SMTP id d9443c01a7336-22dbd3f9de4mr5146115ad.5.1745516061340;
        Thu, 24 Apr 2025 10:34:21 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100c4esm16270255ad.173.2025.04.24.10.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 10:34:20 -0700 (PDT)
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
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v6 05/14] riscv: sbi: add SBI FWFT extension calls
Date: Thu, 24 Apr 2025 19:31:52 +0200
Message-ID: <20250424173204.1948385-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424173204.1948385-1-cleger@rivosinc.com>
References: <20250424173204.1948385-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_183424_085860_ADBFE271 
X-CRM114-Status: GOOD (  13.59  )
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
bmFtaWNyby5jb20+Ci0tLQogYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgfCAyMCArKysrKysrKysr
KysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL3NiaS5jCmluZGV4IGQ1N2U0ZGFlN2RhYy4uMDcwMDE0ZmYzNWQ0IDEwMDY0NAotLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC9zYmkuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwpAQCAt
Mjk5LDYgKzI5OSw4IEBAIHN0YXRpYyBpbnQgX19zYmlfcmZlbmNlX3YwMihpbnQgZmlkLCBjb25z
dCBzdHJ1Y3QgY3B1bWFzayAqY3B1X21hc2ssCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBib29s
IHNiaV9md2Z0X3N1cHBvcnRlZDsKKwogLyoqCiAgKiBzYmlfZndmdF9zZXQoKSAtIFNldCBhIGZl
YXR1cmUgb24gdGhlIGxvY2FsIGhhcnQKICAqIEBmZWF0dXJlOiBUaGUgZmVhdHVyZSBJRCB0byBi
ZSBzZXQKQEAgLTMwOSw3ICszMTEsMTUgQEAgc3RhdGljIGludCBfX3NiaV9yZmVuY2VfdjAyKGlu
dCBmaWQsIGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVfbWFzaywKICAqLwogaW50IHNiaV9md2Z0
X3NldCh1MzIgZmVhdHVyZSwgdW5zaWduZWQgbG9uZyB2YWx1ZSwgdW5zaWduZWQgbG9uZyBmbGFn
cykKIHsKLQlyZXR1cm4gLUVPUE5PVFNVUFA7CisJc3RydWN0IHNiaXJldCByZXQ7CisKKwlpZiAo
IXNiaV9md2Z0X3N1cHBvcnRlZCkKKwkJcmV0dXJuIC1FT1BOT1RTVVBQOworCisJcmV0ID0gc2Jp
X2VjYWxsKFNCSV9FWFRfRldGVCwgU0JJX0VYVF9GV0ZUX1NFVCwKKwkJCWZlYXR1cmUsIHZhbHVl
LCBmbGFncywgMCwgMCwgMCk7CisKKwlyZXR1cm4gc2JpX2Vycl9tYXBfbGludXhfZXJybm8ocmV0
LmVycm9yKTsKIH0KIAogc3RydWN0IGZ3ZnRfc2V0X3JlcSB7CkBAIC0zNDgsNiArMzU4LDkgQEAg
aW50IHNiaV9md2Z0X3NldF9jcHVtYXNrKGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgdTMyIGZlYXR1
cmUsCiAJCS5lcnJvciA9IEFUT01JQ19JTklUKDApLAogCX07CiAKKwlpZiAoIXNiaV9md2Z0X3N1
cHBvcnRlZCkKKwkJcmV0dXJuIC1FT1BOT1RTVVBQOworCiAJaWYgKGZlYXR1cmUgJiBTQklfRldG
VF9HTE9CQUxfRkVBVFVSRV9CSVQpCiAJCXJldHVybiAtRUlOVkFMOwogCkBAIC02NzksNiArNjky
LDExIEBAIHZvaWQgX19pbml0IHNiaV9pbml0KHZvaWQpCiAJCQlwcl9pbmZvKCJTQkkgREJDTiBl
eHRlbnNpb24gZGV0ZWN0ZWRcbiIpOwogCQkJc2JpX2RlYnVnX2NvbnNvbGVfYXZhaWxhYmxlID0g
dHJ1ZTsKIAkJfQorCQlpZiAoc2JpX3NwZWNfdmVyc2lvbiA+PSBzYmlfbWtfdmVyc2lvbigzLCAw
KSAmJgorCQkgICAgc2JpX3Byb2JlX2V4dGVuc2lvbihTQklfRVhUX0ZXRlQpKSB7CisJCQlwcl9p
bmZvKCJTQkkgRldGVCBleHRlbnNpb24gZGV0ZWN0ZWRcbiIpOworCQkJc2JpX2Z3ZnRfc3VwcG9y
dGVkID0gdHJ1ZTsKKwkJfQogCX0gZWxzZSB7CiAJCV9fc2JpX3NldF90aW1lciA9IF9fc2JpX3Nl
dF90aW1lcl92MDE7CiAJCV9fc2JpX3NlbmRfaXBpCT0gX19zYmlfc2VuZF9pcGlfdjAxOwotLSAK
Mi40OS4wCgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0t
cmlzY3YK
