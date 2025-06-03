Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0E4C5B555
	for <kvm-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 15:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rPWKrVYRf+q0JES9EjXhXSme4ANhJhgreaI0faoFcMk=; b=K9VB53XuFbzuvm
	SGqBa38W561Uru9uN6isgvngvbCYieIW4lAwqaBMSajnKU9SAjTtSpK9UYsOJttAoupO+1+iCrUI0
	fdwxnaA4jrlKrvAlsqs/OFAZgMGg3U79uiIL7lRwjcPPxMQnuu8jPtigG6HUI/JF16R8uaTXhK1f3
	m4Q8Zh6BIgo8+nJ4/I85D4W6OcZiloE2gSQWle6RKX7pkJPRwjdG/pAxl6PFKfMUtInrShzj5FIu8
	k0deYsbNa4nPCvF8zro24SJrWHpS3SVslcInzkpCb0m1hxkorzgYLymbQOg3q8v8xEUkJZhs3f1o4
	vtFjEf7bkvVnwIYV4gLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMU0R-0000000BLWe-3Weu;
	Tue, 03 Jun 2025 15:56:51 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMTr5-0000000BK6t-1OyI
	for kvm-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 15:47:12 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b13e0471a2dso3671313a12.2
        for <kvm-riscv@lists.infradead.org>; Tue, 03 Jun 2025 08:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748965630; x=1749570430; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uAZRYq1Ut1OdjviQhLtiG1Y1zJCF/nlXagPu6jbCZyo=;
        b=YaRY/q6d0eO0ZMzoVnUB/dPrX1T5nFlwWNAoV77Fq4kjrExvlBs1ik1rX9VXS90uqx
         4qUunAtSkJZ+sDE/wjoJpjzzV2o1VfHulaw8bUF2ySJVZGwspf+l7w3lZ9MxOKUMgS4+
         pgt/do7teCea03rUafj4zHi0SeskRaGwktu/Y9zXhIuWnpsJgiWChAf+ao298M0jDBXy
         WC+9Apv2NH9cfXtUJIeX9NBcpe32HCKYTIJi+nyjgEy1470zcXIjgIVsTfaSV8JkZ/2x
         oND12c9hh55q95KOU/pBUJoIQvFJH6bvmY0/QZWuPWCSzrgRLlrICF25Wcrjz9V65dI1
         bAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748965630; x=1749570430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAZRYq1Ut1OdjviQhLtiG1Y1zJCF/nlXagPu6jbCZyo=;
        b=v8LRM4CX4wOhSmg545KVsakQF1DWA41BhedWixGXrEl94wEb61uc1tb5U+6jw7NgAz
         2rjTacCHLej6Keqo6D8wOHzlt+SYbxKMxk5vW1WzuY1h3rXowS2WXrfH9fZVOhdx/dxn
         lWmGQAmMr7wl02Nkwi0lKV6ZMz0AbbYlQS/XMdym6TyA0GDUhbMgKbxTNcDmuOfjwpcd
         Iy1JMZ9/1atN922esGj3kYNJqBui2/afK6vivd2CXmIKYqh85hnn/TVXB4QuA0hj1Ond
         tK0P290B5w7oMOuMrZon53bt6SvYh9tP35sQ4cQNVvNfrS+S2NkE7zDb4QMfTm+AXIZ7
         opjA==
X-Forwarded-Encrypted: i=1; AJvYcCVI5EIZS/AbED+1SfqF0SQCOQZIpM1s+ilj7jIZ5oCRelrBvxBur3P5lNy75lguJpj53DysS0MXhUg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2nb/TK0qWfDf95OK0vGwRn0YyZQi5iPPF+SMveXrikf3Teuax
	uwDKlES84Ju1tfjkb/qPq/+BZleyljt5YeyUzVPRCxI0A8/4TdVn4JitiBmfKoZ77yc=
X-Gm-Gg: ASbGncuHEYe6dKt9i7mssk3FeMKRbBxZwiWQSgJusBOwVo/prbC5otqk+3mOyd+bPxa
	gPc5FsxXQrpDCE1WendZIKOYA8Oz/4/mDVuhfopU+V3EDye9NnNOV6QkS1Zpvr+vPgdXSzSjr1b
	VZr4luHCw1Ju4hz4evICdbfXACLhwv8FhuijU6WvNBZxKhq1XvJ5+WpemxZml/TdVqXR+Iwyt00
	SHc8lEUFPkhFGc+Gnd6CAaGhlFkREg4fX/+CUkl7BaRomXWPRQZ2Ag5KEpq1XNBhpJxPFz7Cnrg
	roPRvJmr2Qk9JkrpnazWVyR0ufxT8t9trESnUf4tmfKf7SNqj7c+
X-Google-Smtp-Source: AGHT+IFk55Tqv0nEFS/cl9Itdt9glV+n1TFbN/ZApJ5R2VK626y+Nd86g4lTdFOyyqbshXN0CvfxsQ==
X-Received: by 2002:a05:6a20:3944:b0:1f5:8622:5ecb with SMTP id adf61e73a8af0-21ae00c7013mr32303197637.34.1748965630424;
        Tue, 03 Jun 2025 08:47:10 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb9711asm6306066a12.57.2025.06.03.08.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 08:47:09 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ved Shanbhogue <ved@rivosinc.com>
Subject: [kvm-unit-tests v2 0/2] riscv: Add double trap testing
Date: Tue,  3 Jun 2025 17:46:48 +0200
Message-ID: <20250603154652.1712459-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_084711_609620_42D44B4B 
X-CRM114-Status: GOOD (  11.47  )
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

QWRkIGEgdGVzdCB0aGF0IHRyaWdnZXJzIGRvdWJsZSB0cmFwIGFuZCB2ZXJpZnkgdGhhdCBpdCdz
IGJlaGF2aW9yCmNvbmZvcm1zIHRvIHRoZSBzcGVjLiBBbHNvIHVzZSBTU0UgdG8gdmVyaWZ5IHRo
YXQgYW4gU1NFIGV2ZW50IGlzCmNvcnJlY3RseSBzZW50IHVwb24gZG91YmxlIHRyYXAuCgpJbiBv
cmRlciB0byBydW4gdGhpcyB0ZXN0LCBvbmUgY2FuIHVzZSB0aGUgZm9sbG93aW5nIGNvbW1hbmQg
dXNpbmcgYW4KdXBzdHJlYW0gdmVyc2lvbiBvZiBPcGVuU0JJOgoKJCBRRU1VPXFlbXUtc3lzdGVt
LXJpc2N2NjQgXAogIEZJUk1XQVJFX09WRVJSSURFPTxvcGVuc2JpPi9md19keW5hbWljLmJpbiBc
CiAgLi9yaXNjdi1ydW4gcmlzY3YvaXNhLWRibHRycC5mbGF0CgotLS0KCnYyOgogLSBVc2UgV1JJ
VEVfT05DRS9SRUFEX09OQ0UgZm9yIHNoYXJlZCB2YXJpYWJsZXMKIC0gUmVtb3ZlIGxvY2tpbmcg
ZmxhZyBmb3IgbGFzdCB0ZXN0CiAtIEZpeCBhIGZldyB0eXBvcwogLSBTa2lwIGNyYXNoIHRlc3Qg
aWYgZW52IHZhciBET1VCTEVfVFJBUF9URVNUX0NSQVNIIGlzbid0IHNldAogLSBTa2lwIGNyYXNo
IHRlc3QgaWYgU1NFIGV2ZW50IHVucmVnaXN0ZXJpbmcgZmFpbGVkCiAtIFJlbW92ZSBTRFQgY2xl
YXJpbmcgcGF0Y2gKIC0gRml4IHdyb25nIGNoZWNrIHVzaW5nIHJldC52YWx1ZSBuc3RlYWQgb2Yg
cmV0LmVycm9yCgpDbMOpbWVudCBMw6lnZXIgKDIpOgogIGxpYi9yaXNjdjogZXhwb3J0IEZXRlQg
ZnVuY3Rpb25zCiAgcmlzY3Y6IEFkZCBJU0EgZG91YmxlIHRyYXAgZXh0ZW5zaW9uIHRlc3RpbmcK
CiByaXNjdi9NYWtlZmlsZSAgICAgICAgICAgIHwgICAxICsKIGxpYi9yaXNjdi9hc20vY3NyLmgg
ICAgICAgfCAgIDEgKwogbGliL3Jpc2N2L2FzbS9wcm9jZXNzb3IuaCB8ICAxMCArKwogbGliL3Jp
c2N2L2FzbS9zYmkuaCAgICAgICB8ICAgNSArCiBsaWIvcmlzY3Yvc2JpLmMgICAgICAgICAgIHwg
IDIwICsrKysKIHJpc2N2L2lzYS1kYmx0cnAuYyAgICAgICAgfCAyMTEgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKIHJpc2N2L3NiaS1md2Z0LmMgICAgICAgICAgfCAgNDkg
KysrLS0tLS0tCiByaXNjdi91bml0dGVzdHMuY2ZnICAgICAgIHwgICA0ICsKIDggZmlsZXMgY2hh
bmdlZCwgMjY2IGluc2VydGlvbnMoKyksIDM1IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IHJpc2N2L2lzYS1kYmx0cnAuYwoKLS0gCjIuNDkuMAoKCi0tIAprdm0tcmlzY3YgbWFpbGlu
ZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
