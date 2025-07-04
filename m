Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CC0C83F04
	for <kvm-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 01:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=94Uy6241TC5TLUQZaKCg6CNxyyOHJVEOQ5lQzfmD/Wk=; b=UfTqGD8xJ68Q59
	4zFk9Xr045mY+QN9GTl4tkDfZAnd948LAvzDRm3AqNG8++3G7lezJzvhUPHeEC1eU8Q+5awsQeD8y
	/DpmdBwa6l4hKUsCunbIIHEbewJLlC3LTrncoBZZz4NhQsD4fXNzD7+8QKkVCNQaxmPX8EDq4LDip
	sFDpReFoHbSSr4iCN8YO2zCv5xzRdLPOJSgrmxRdu/kFSueMrgC3/vXHIrxMBCpZPoWa6SSz8zRzS
	CmuVwj1YsE+vg25ygFicFhgbkFhLSYj/Bp73FrFjYwAIHFXvs79TOpri6uJU3ncHSQWn26LXpIS1/
	VQ1NhdyOrCS7b45iaBog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXVhJ-0000000D1i8-3Pmw;
	Fri, 04 Jul 2025 01:58:41 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXVhH-0000000D1hg-2YtX
	for kvm-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 01:58:41 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6fae04a3795so6183376d6.3
        for <kvm-riscv@lists.infradead.org>; Thu, 03 Jul 2025 18:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1751594318; x=1752199118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QnLXVWExKoNZiJLIxtursHY+uAzhVs7mpFreujfZRkc=;
        b=eXRD049kQ/rtnCWyJiQ3CC5EpSnb5u0B0/nQpgVL9+aW9Rc+Yg5oEDU+qnAhD1/Lek
         axx8EXclTIVXDhPjPOekaz8l3p7eLbuQi0nZYFqeH77nuC71uY5oqyld3ghqu5jeFmab
         aSSeoMIFYtxALgZql3JTVJMfFfA9jvCNySs7Oi2MGXiPPQz+JIu4fSb2lxTY53otI9G/
         JQ7pQ3/Tv5zkauRkY2Ea62X16EQqFtjKAOgNTgJQFPJ+G6BJCJKL5rxbHlaEcdttWi81
         7J28U+B8zjrKXH238Xd09lpas3RdWt6/rb1QMJ98bh7nP67b+JzEWGiWjo7co9guth7T
         9aPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751594318; x=1752199118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QnLXVWExKoNZiJLIxtursHY+uAzhVs7mpFreujfZRkc=;
        b=B7ICoClU3nVhU8C0v1u3G69NY/tGUn31alrNX8vkL4th+yHX7R8bLA8t2xKhthf+ow
         bOgPAIyeH5qbnGf8AFRVVKonAYVHMHCnY8VUJcfLRQyql03lpxSpFqkod57geO2ZxxSv
         bhn0IGfu5vIV5yRvhLOrhyqXIq2U4xvNazrcY0/Aq9z8wRIhUl0fAFcWjoiYuzZLwdBi
         cXZuJAjtLtdq9/jF7TMRRk0B+bL9U5SKQHUIodcGOpaYKkrDZAwPQXwRnrrBoprHoC2e
         n68jOvwsNnoQB6EuASMME+JYVNEOApLKuHe78Y1s+YKqW/HMrkXk1oqLPuEQpxhWngk1
         Slrg==
X-Forwarded-Encrypted: i=1; AJvYcCW7wuy6lt0PnI8mbial9kFYM8BNWCuHKEhXwqFZH6wLe2iu29MZmJ9j1SM/8nR8aVPRH2qjrq1lPPg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz71Dz0/P/qMBNeiUU02Ecqhe3j5cQUWRD9WV3N+e8a/+qtvNLM
	u/oNyTK4re/ZPWX9q6oxLp/c9ZOEogmuq6JJ3BW2mgjt9OJJfi6I0ZzxlufIU7h+lCk=
X-Gm-Gg: ASbGncvVFDdHaXHX9xSMkVYweg8PyYvLVCcL1W7P7Cn8BbwP/VyWYkWZKl/fl35AkCK
	qeX0yYW0V+xH4rACn2NxnFReGQNwqbN4HeG5zEpF4EzRGb1Sux4rZaGwODE41LUXVdKGIfOXWMT
	hNpCWOgQrPz+DoylA2osNL8uygTmFjeDzT7Z/E8Oey+elGzNd0zHVJgKsQFk2Fsvj55BVeWA65c
	GZuozqT2E5ox1qMCX7dGbM6oG6QDVKfUk9KR7tamGqfR/Izx67h0U3MgL/kWuJbNkGjomPmvhzG
	OmqEPycyXeHXWgeb5KLtZLMtuQn5ETKZhj4PpqXPd78Pzhrpo62H1lZQs7877EXdDeKmXvd43Yz
	KHRCcslnniw==
X-Google-Smtp-Source: AGHT+IFjxkaBEImztNDgLRUCPF9Hxz9tbtkMiO4rL8Aov5ucKBXPKeNdTk/a5C14X/9WkJXb6dZhzw==
X-Received: by 2002:a05:6214:4291:b0:6e8:fcde:58d5 with SMTP id 6a1803df08f44-702c6dedfa8mr10308586d6.42.1751594318341;
        Thu, 03 Jul 2025 18:58:38 -0700 (PDT)
Received: from jesse-lt.ba.rivosinc.com ([96.224.57.66])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d601a7sm5842446d6.107.2025.07.03.18.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 18:58:38 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Andrew Jones <andrew.jones@linux.dev>
Subject: [kvm-unit-tests PATCH] riscv: Use norvc over arch, -c
Date: Thu,  3 Jul 2025 18:58:37 -0700
Message-ID: <20250704015837.1700249-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_185839_735473_3C934302 
X-CRM114-Status: GOOD (  10.58  )
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

VGhlIExpbnV4IGtlcm5lbCBtYWluIHRyZWUgdXNlcyAibm9ydmMiIG92ZXIKImFyY2gsIC1jIiBj
aGFuZ2UgdG8gbWF0Y2ggdGhpcy4KCkdDQyAxNSBzdGFydGVkIHRvIGFkZCBfemNhX3pjZCB0byB0
aGUgYXNzZW1ibGVyIGZsYWdzIGNhdXNpbmcgYSBidWcKd2hpY2ggbWFkZSAiYXJjaCwgLWMiIGdl
bmVyYXRlIGEgY29tcHJlc3NlZCBpbnN0cnVjdGlvbi4KCkxpbms6IGh0dHBzOi8vc291cmNld2Fy
ZS5vcmcvYnVnemlsbGEvc2hvd19idWcuY2dpP2lkPTMzMTI4CkNjOiBDbMOpbWVudCBMw6lnZXIg
PGNsZWdlckByaXZvc2luYy5jb20+ClNpZ25lZC1vZmYtYnk6IEplc3NlIFRhdWJlIDxqZXNzZUBy
aXZvc2luYy5jb20+Ci0tLQogcmlzY3YvaXNhLWRibHRycC5jIHwgMiArLQogcmlzY3Yvc2JpLWRi
dHIuYyAgIHwgMiArLQogcmlzY3Yvc2JpLWZ3ZnQuYyAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcmlzY3YvaXNh
LWRibHRycC5jIGIvcmlzY3YvaXNhLWRibHRycC5jCmluZGV4IGI3ZTIxNTg5Li5hZjEyODYwYyAx
MDA2NDQKLS0tIGEvcmlzY3YvaXNhLWRibHRycC5jCisrKyBiL3Jpc2N2L2lzYS1kYmx0cnAuYwpA
QCAtMjYsNyArMjYsNyBAQCBkbyB7CQkJCQkJCQkJCVwKIAl1bnNpZ25lZCBsb25nIHZhbHVlID0g
MDsJCQkJCQlcCiAJYXNtIHZvbGF0aWxlKAkJCQkJCQkJXAogCSIJLm9wdGlvbiBwdXNoXG4iCQkJ
CQkJCVwKLQkiCS5vcHRpb24gYXJjaCwtY1xuIgkJCQkJCVwKKwkiCS5vcHRpb24gbm9ydmNcbiIJ
CQkJCQlcCiAJIglzdyAlMCwgMCglMSlcbiIJCQkJCQkJXAogCSIJLm9wdGlvbiBwb3BcbiIJCQkJ
CQkJXAogCTogOiAiciIgKHZhbHVlKSwgInIiIChwdHIpIDogIm1lbW9yeSIpOwkJCQkJXApkaWZm
IC0tZ2l0IGEvcmlzY3Yvc2JpLWRidHIuYyBiL3Jpc2N2L3NiaS1kYnRyLmMKaW5kZXggYzRjY2Q4
MWQuLjEyOWY3OWI4IDEwMDY0NAotLS0gYS9yaXNjdi9zYmktZGJ0ci5jCisrKyBiL3Jpc2N2L3Ni
aS1kYnRyLmMKQEAgLTEzNCw3ICsxMzQsNyBAQCBzdGF0aWMgX19hdHRyaWJ1dGVfXygobmFrZWQp
KSB2b2lkIGV4ZWNfY2FsbCh2b2lkKQogewogCS8qIHNraXAgb3ZlciBub3Agd2hlbiB0cmlnZ2Vy
ZWQgaW5zdGVhZCBvZiByZXQuICovCiAJYXNtIHZvbGF0aWxlICgiLm9wdGlvbiBwdXNoXG4iCi0J
CSAgICAgICIub3B0aW9uIGFyY2gsIC1jXG4iCisJCSAgICAgICIub3B0aW9uIG5vcnZjXG4iCiAJ
CSAgICAgICJub3BcbiIKIAkJICAgICAgInJldFxuIgogCQkgICAgICAiLm9wdGlvbiBwb3BcbiIp
OwpkaWZmIC0tZ2l0IGEvcmlzY3Yvc2JpLWZ3ZnQuYyBiL3Jpc2N2L3NiaS1md2Z0LmMKaW5kZXgg
ODkyMGJjYjUuLmZkYTdlYjUyIDEwMDY0NAotLS0gYS9yaXNjdi9zYmktZndmdC5jCisrKyBiL3Jp
c2N2L3NiaS1md2Z0LmMKQEAgLTE3NCw3ICsxNzQsNyBAQCBzdGF0aWMgdm9pZCBmd2Z0X2NoZWNr
X21pc2FsaWduZWRfZXhjX2RlbGVnKHZvaWQpCiAJCSAqIERpc2FibGUgY29tcHJlc3Npb24gc28g
dGhlIGx3IHRha2VzIGV4YWN0bHkgNCBieXRlcyBhbmQgdGh1cwogCQkgKiBjYW4gYmUgc2tpcHBl
ZCByZWxpYWJseSBmcm9tIHRoZSBleGNlcHRpb24gaGFuZGxlci4KIAkJICovCi0JCSIub3B0aW9u
IGFyY2gsLWNcbiIKKwkJIi5vcHRpb24gbm9ydmNcbiIKIAkJImx3ICVbdmFsXSwgMSglW3ZhbF9h
ZGRyXSlcbiIKIAkJIi5vcHRpb24gcG9wXG4iCiAJCTogW3ZhbF0gIityIiAocmV0LnZhbHVlKQot
LSAKMi40My4wCgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9r
dm0tcmlzY3YK
