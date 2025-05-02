Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE27C3ABAC
	for <kvm-riscv@archiver.kernel.org>; Fri,  2 May 2025 06:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Hx7yh46RmMi3BGV7w0vriE1JEi1ATrXMLxcKkV7pMR0=; b=YnGv+kHm9Jm5DS
	cPPfmvvKhRKQyOaHXdM1zgCg5Ei7+3EpEZWAjdl7pkbDityaAj6A2NGeW/QYYEWr1Dc8/GPq04ufR
	ykiyAY4fXAOmVLIm9/iM+Ym2nQMgmJb2IrywAB/vjz9hlGW4Suny9f3/5K/m/L6uGkVOHJiGqe2iK
	jeNybMz6eW+P8u8IXX1rMG+/sZEaHnilP12LFyFW6MPSQxRN8dRhA/yanCj5RKZPwQi1Tmhvd5788
	+ja8PqbF7H/Oi0mtFbY3sWju+8L7cYC1j50OB61IwjR9opoyJpb6UjyLl1p+/yxW9KgYZDkW1CpGs
	FHlizAO3FfC7u3jUY0/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAkGa-000000011fp-2NSU;
	Fri, 02 May 2025 06:53:00 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAkGY-000000011es-0Cjs
	for kvm-riscv@lists.infradead.org;
	Fri, 02 May 2025 06:52:59 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3d940c7ea71so9711385ab.0
        for <kvm-riscv@lists.infradead.org>; Thu, 01 May 2025 23:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1746168777; x=1746773577; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jLTAl+FeAYSKQcQF7p9sJodq+vcj25r5QAMFCz6+Z3s=;
        b=EsqC2KIG65DYwGNpbBzkbTndBoHsCpyq03u7Ujlr8+A/4s4axqQhS3N8b+J0MlBsox
         6+8JmvARd2m3aCX90XszbYYuaEHfXZPL+0cEgz6geH1n8Jhy8UybhYL0zCRfD3DmAEZn
         mzrCcGS8GevS0kUU2CCvORCWK3NWRcDPgiW/FIy837ZyijVkq/5HQE9oZmTRZ7QX18sl
         48tNgm5V94s/BwkNisWCUHWYEWOr260KpCA6WzEUppi5hTCw5GpSVJN+cJ4hvcEKyyIZ
         UL8snsL8pPA8vcFrMaIi+OKmHccANZltcSY5H+MwKGr692YVUp1D2r4M4S2rROwaEIUS
         dqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746168777; x=1746773577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jLTAl+FeAYSKQcQF7p9sJodq+vcj25r5QAMFCz6+Z3s=;
        b=lzIvsm+3pz4f0wqtivYKyA721LCdaa2GDrOFPoMApwru59pDfhJnhe2E0DfEJzDWkG
         iyqWzWddQLnkWE8cN6ZF4iYnKDV0Rb9SanjsvZ3roT4XQut9KjZW47uSG0FDRuy8fU3q
         2D7lZ8RNRuuW7WkB7EVprjhBg0lNcqAXjL0V7L7HR48l9bsxxKPDV50S6YG6iO9lVS0g
         uRKZykPwSBvXOCzvuGt1GcbifFTbi8Wcif4aXP7DZgc2lW/0s03E79KxDYzexhJbqZDU
         zTBF0q5PvGN2hbyrgKWmwH1W2DLn3DP3C2CyW3kY6CWn6fRSiB0OS30tqISOJt3hzAIo
         0SnA==
X-Forwarded-Encrypted: i=1; AJvYcCV4WANTRO5GLLlBdlPKXt8mZJQ4q0d+gwwfQ6FKWpY5GvQwwWEVwEFWsaNxCb1e4zvmD3XbunHYoX4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyHojWULeOCkhsGE+DyOx4Aqznx88oqwBtDoGW7BjYUZBO7NQcd
	8ERzb6KbGaJV7QL5fZbs9ecwcYAwsg6ry+FDhXiB7zv+v7wOjsy4BOkMlP8ugOenmIqS+IAlbML
	VJmMDXzS/srbDFQyht7hZ5LdiaoQgLmf419P1+Q==
X-Gm-Gg: ASbGncuncqZfTgNezmMFdXbqHcuqRDAeLFCzLWwWA2QmfonATx44UyC/NHgNO3cKYr3
	794pi3+SITIeZpwZJdAuzedyBzoMFRcrZ9aNdoi1nf9uOpmnI5ZHDrshFBhoAovGajubAA1Rjc4
	/tnNz44Y3+mJhFCt+wqfc0MtMgwWOUd7AQBg==
X-Google-Smtp-Source: AGHT+IE3Tx+D1sTsJd7eLqFty9WstV2/FtUKtjDrFtmODwKSFJySlTQeqvcdWL3dLUeN0h3IDPBFvj6uN+EjXA3kCW4=
X-Received: by 2002:a05:6e02:1fcb:b0:3d8:975:b825 with SMTP id
 e9e14a558f8ab-3d97c141a61mr20039855ab.5.1746168777040; Thu, 01 May 2025
 23:52:57 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 2 May 2025 12:22:46 +0530
X-Gm-Features: ATxdqUGAB19XvC5KYJ0fhdKln-jTeRa6jT7I7LFhf0qZedVaeYBhPkotn1vsv9M
Message-ID: <CAAhSdy09tkokvdvACCQACLdvppTTQHDOR+O4jtkhVP4PaW_k7w@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 6.15 take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_235258_354650_6987B4C7 
X-CRM114-Status: UNSURE (   5.74  )
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

SGkgUGFvbG8sCgpXZSBoYXZlIG9uZSBmaXggZm9yIHRoZSA2LjE1IGtlcm5lbCB3aGljaCBhZGRz
IG1pc3NpbmcKcmVzZXQgb2Ygc21zdGF0ZWVuIENTUnMuCgpQbGVhc2UgcHVsbC4KClJlZ2FyZHMs
CkFudXAKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgYjQ0MzI2NTZiMzZlNWNj
MWQ1MGExZjJkYzE1MzU3NTQzYWRkNTMwZToKCiAgTGludXggNi4xNS1yYzQgKDIwMjUtMDQtMjcg
MTU6MTk6MjMgLTA3MDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoK
CiAgaHR0cHM6Ly9naXRodWIuY29tL2t2bS1yaXNjdi9saW51eC5naXQgdGFncy9rdm0tcmlzY3Yt
Zml4ZXMtNi4xNS0xCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gODdlYzdkNTI0OWJi
OGViZjQwMjYxNDIwZGEwNjlmYTIzOGMyMTc4OToKCiAgS1ZNOiBSSVNDLVY6IHJlc2V0IHNtc3Rh
dGVlbiBDU1JzICgyMDI1LTA1LTAxIDE4OjI2OjE0ICswNTMwKQoKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpLVk0vcmlzY3Yg
Zml4ZXMgZm9yIDYuMTUsIHRha2UgIzEKCi0gQWRkIG1pc3NpbmcgcmVzZXQgb2Ygc21zdGF0ZWVu
IENTUnMKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KUmFkaW0gS3LEjW3DocWZICgxKToKICAgICAgS1ZNOiBSSVNDLVY6IHJl
c2V0IHNtc3RhdGVlbiBDU1JzCgogYXJjaC9yaXNjdi9rdm0vdmNwdS5jIHwgMiArKwogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3Zt
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
