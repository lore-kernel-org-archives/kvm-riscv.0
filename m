Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBD7CCF9E0
	for <kvm-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 15:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uZ6i6WzF2aJTc3jvR6mRKWae3PpKm91qDHdk/VIZQ+Q=; b=CTbXnerTL5nqLF
	ZKlMoXZ60Yu0rcNu9qaq6IdAU8EH79EB90hUaZ5L1rbKQcmykdJADsn19C5ycKB2o1utBk+qrR2lI
	PD4kcyoqKB5m7qGn8oXd5xiKSS7XqnvoTJuuLjn3MrQkIdDczulxOxat+kJ7PWJN4kcEidexza2H4
	EYZ13yAc4DMDMHo0Bm27E5dmtweot2OakUxZELOp7Y13jB3shfnD2MzO/3hH8wAe6g6aanArnKOW7
	79R4D+8HphCmFjIDaaK2ARiowUz4ml5xjMpkt9/CVGBlQ3sXil5qaEz3JRrsJSsRIX5v98mu2W9r3
	1ooSUHriML/0dTlJXnEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKC6-00000009tCl-1d9L;
	Fri, 24 Oct 2025 15:59:10 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKC3-00000009tBr-2NNe
	for kvm-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 15:59:09 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4270900c887so285637f8f.1
        for <kvm-riscv@lists.infradead.org>; Fri, 24 Oct 2025 08:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1761321545; x=1761926345; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CMkA2GjFtS35CrtWygsmj9Qukyn3zMCBS8X6+wKs1pA=;
        b=GTAGP2N7XIkxe1/iNNJYVB8gCsqdwEtHFMhtPwbgZ/bv1+3KrbC/qtyW4VMZoIhBAe
         OLshWybGrH5nDSb9YkfhvjiUpm1xbUcQlTezhydGmcxvjmxA+g9nGzDdYiWVUGbCi8H1
         Dm6lSN/g32NZlCvOnQcZ7s8nxv8gGK62iUcArhya7VI6ZylywfEueiZ1fq8Z674hHZE7
         xuBmk8a+hfgwUSJcucz+tuluIPf/yAuWLU76/CKlWuJ6IQ7erl8619nIz41elaTzxQJ2
         kzp6J2l3ZUT+YNOfKMdRM+U/p67LFoxstHS07sGwJ+1xKCa1z8QnYS+dvhxQsrh4qZP1
         6DCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761321545; x=1761926345;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CMkA2GjFtS35CrtWygsmj9Qukyn3zMCBS8X6+wKs1pA=;
        b=lUR1y4mdd05wp6NWbnCTE70sz51HGxBdZJd97gmERp/Fwj/EAJCT4oQFHp08Oaki85
         qS/KeWmE0/tj46jabu9p7aWvIvlzp+6RSoCic9a5BYxE/ON20DeSA9yDLGE9ut8JqN2+
         M8jM1330juLVDJA8hl9FEZejHLpAeJv6QlQPc0yYU8oNEwI5VsBDfbqFvrQU39fCTVxd
         gQlf2D4QjH8SJDcUKRyZIc/x/Y85JPHSOxZ8ulFE6uw/SiVT/txKc33nwYBGKGiEO8J1
         yVJfqGLSNOrjxbwjuYwMInQoY9tJaXDEsip3QhadUOB9QnWpBZ/83VR1U6omQMaaxNgX
         Uovw==
X-Forwarded-Encrypted: i=1; AJvYcCW2cl7D3nb8PPEb4LWjSjAlgwlz8kAAWxYCQ9e7vPmGO4xIiu8hJJzCBdckRqKFOjMgWBFFQi65OYI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwCDPQe+/wo7jyup8iMvTZ8yCJojxnN0y9aHhWzk94C65yzYUwj
	1ugsr9zrGX4/RrNpPuS7fkWInlAGKseoBhuvXhU60qKqHQyNwMBg70X6jCXiCyS1D4/Rpx5Ayzs
	Lw/mu
X-Gm-Gg: ASbGncsYjbttsccAi6hZKv5PkQGDfTSFZnl25v/UoNzEQPW7w1kRsjGmdvEaVqa+O87
	e3SxZ1URb6W/FwQnWV00soYDg7guHie8pQ95RXrGv9JGYk3eATGI3H2qHBrequHMY/7RFBMtQ/F
	Tzbks15tB2SLTIrACIb+wi+2AdQlw50Hh2CBF8b6VN1ekkWyrWGhnUU+TyCpDrJOGOieVBAPuSE
	5Is/Sl/RI7Pmft14rVzxoo8/dc/s5HRtaFL3rU4g2lIbKUvHNhUtrnXqCqLDNX2212kOSjSCOB6
	AOHz/cauXpU3rVNhFiQF9pNF6UQbezULiaHe+gVZw+n4lnRIiIX2+7CyLrYLZp7rPvsbJ/4ymx4
	haTtP260Huq3EGNB4WogAbLK2Dve2dOBSmnfeXvgDupaq9KK8RcMQazf8z3a7xPBI
X-Google-Smtp-Source: AGHT+IHzyU5pYxWMYNs2BrkiY+/dp1o4XbiLiEzgONC4XzV8TU4JV6blb/UhR9Zpru7RSpHGlRXUMA==
X-Received: by 2002:a05:600c:1d25:b0:471:152a:e574 with SMTP id 5b1f17b1804b1-474942c4fa0mr82893575e9.2.1761321545255;
        Fri, 24 Oct 2025 08:59:05 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::3052])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475c4342373sm185962545e9.12.2025.10.24.08.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 08:59:04 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 24 Oct 2025 17:59:01 +0200
Message-Id: <DDQODLNQSLO3.E5HMVVMXWDVN@ventanamicro.com>
Subject: Re: [PATCH 2/2] KVM: riscv: selftests: Detect supported vm modes
Cc: <wu.fei9@sanechips.com.cn>, <kvm-riscv@lists.infradead.org>, "kvm-riscv"
 <kvm-riscv-bounces@lists.infradead.org>
To: "Wu Fei" <atwufei@163.com>, "Andrew Jones" <ajones@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20251017110908650RWBl7sDIk6WUGhkvJSH4L@zte.com.cn>
 <202510170319.59H3JmWd056039@mse-fl2.zte.com.cn>
 <20251017-f2c1b717d2364067c64f95a6@orel>
 <93d3af21-5d3d-465c-a9f2-0eaed7475fb3@163.com>
 <DDNEF8ASSO19.2P4OJ3KYPWRIH@ventanamicro.com>
 <20251021-a97dc10e19bd8542675484dd@orel>
 <5ed53d05-2ed8-43dc-8a41-1906b6982c80@163.com>
 <DDOX5JZWQK87.2SZ1CS39ZZAOZ@ventanamicro.com>
 <7aa181d9-84fe-41e1-af6e-14a3ad6629ef@163.com>
In-Reply-To: <7aa181d9-84fe-41e1-af6e-14a3ad6629ef@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_085907_613410_030CEC23 
X-CRM114-Status: GOOD (  11.01  )
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

MjAyNS0xMC0yNFQyMTo0ODowMSswODowMCwgV3UgRmVpIDxhdHd1ZmVpQDE2My5jb20+Ogo+IE9u
IDEwLzIyLzI1IDIyOjI2LCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4+IEZvciB0ZXN0cyB0aGF0
IHRoYXQgZG9uJ3QgY2FyZSBhYm91dCBwaHlzaWNhbCB3aWR0aCwgd2UgY291bGQKPj4gYWRkOgo+
PiAKPj4gICAgVk1fTU9ERV9QWFhWMzlfNEsKPgo+IEludGVsIGFkZHMgVk1fTU9ERV9QWFhWNDhf
NEsgYmVjYXVzZSAieDg2XzY0IG1hY2hpbmVzIGFyZSBoYXZpbmcgdmFyaW91cyAKPiBwaHlzaWNh
bCBhZGRyZXNzIHdpZHRoIHJhdGhlciB0aGFuIHNvbWUgc3RhdGljIHZhbHVlcyIgYWNjb3JkaW5n
IHRvIAo+IGNvbW1pdCA1NjdhOWYxZTlkZSwgYW5kIHg4NiBoYXMgdG8gcHJvYmUgdGhlIHJlYWwg
Z3BhIHdpZHRoIG9uIHZtIAo+IGNyZWF0aW9uLiBSSVNDLVYgaGFzIDMgZml4ZWQgZ3BhIHdpZHRo
cywgc28gbWF5YmUgd2UgY2FuIHVzZSB0aGUgCj4gZXhwbGljaXQgd2lkdGhzPwoKTWFrZXMgc2Vu
c2UuCgo+PiBJdCBkb2Vzbid0IHNlZW0gbmVjZXNzYXJ5IHRvIHN1cHBvcnQgbW9yZSB0aGFuIHRo
YXQsIGJ1dCBpZiBvdXIgdGVzdHMKPj4gd2FudCBsYXJnZXIgdmlydHVhbCBhZGRyZXNzIHNwYWNl
LCB3ZSBjYW4gYWRkIFY0OCBhbmQgVjU3IHZhcmlhbnRzLgo+Cj4gSSB0aGluayBWNDgvVjU3IGlz
IG5lY2Vzc2FyeSwgaWYgYSBtYWNoaW5lIGlzIGRlc2lnbmVkIHRvIGhhdmUgU1Y0OCAKPiBndWVz
dHMsIGl0J3MgYmV0dGVyIHRvIHRlc3QgaXQuCgpSaWdodC4gIFdlIGFsc28gZ2V0IGluZm9ybWF0
aW9uIGFib3V0IGF2YWlsYWJsZSBndWVzdCBzYXRwIG1vZGVzIGZyb20KS1ZNLCBzbyB3ZSBvdWdo
dCB0byB0ZXN0IHRoYXQgaXQgd2FzIGNvcnJlY3QuCgo+IFNvIGlzIGl0IG9rYXkgdG8gaGF2ZSB0
aGUgY29tYmluYXRpb24gb2YgYWxsIDkgbW9kZXM/Cj4gCVAoNDEsIDUwLCA1NikgeCBWKDM5LCA0
OCwgNTcpCj4gQnV0IG9ubHkgc2V2ZXJhbCBvbmVzIGFyZSBwaWNrZWQgdXAgZm9yIGEgc3BlY2lm
aWMgbWFjaGluZSwganVzdCBhcyAKPiBtZW50aW9uZWQgYWJvdmUsIHdlIHdvbid0IHNlbGVjdCBQ
NDFWMzkgZm9yIFN2NDh4NCBldGMuCgpTb3VuZHMgZ29vZCwgdGhhbmtzLgoKLS0gCmt2bS1yaXNj
diBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
