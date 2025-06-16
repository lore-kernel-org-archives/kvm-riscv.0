Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD7DC71155
	for <kvm-riscv@archiver.kernel.org>; Mon, 16 Jun 2025 13:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OjV0hcXPUqUP8L09KptMM5K53qvAQ5Kq23S84L3hUaw=; b=BTiyQI78cnZFbl
	ct6e+62l7Go0wfSj1bTAXOj5juqSUeFtd1MOKqX34DLhloAGoi144fsmEExrGKAvXEN0OBSQWwe7S
	M6VF+XRuMNxSBm2lBxuQEJVTvMP0hoiRAknTnO7AviG8Gl4SFPvqqvPHxxae1GGucP+08rtNi5pDe
	K/ijd2SvDs/chih+HL01jO80VaHJd5hwNLbTc9CUe6bwVEmRLT1skLfRKFm43PL4oixWmgDKpab7V
	KDB7bXdc3Wf8IUWB+L84oXx7YwgqZ5MlE/fhODTwwrjG0pmszSTJQOVLQ5/fPb6dFSmilqKDRJFdt
	eCHNTztUcQCMN/LWQQCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9jr-00000004WDL-14nb;
	Mon, 16 Jun 2025 13:19:03 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8Un-00000004HDt-09zq
	for kvm-riscv@lists.infradead.org;
	Mon, 16 Jun 2025 11:59:26 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so37944775e9.1
        for <kvm-riscv@lists.infradead.org>; Mon, 16 Jun 2025 04:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750075163; x=1750679963; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v7RJ7RnL5M/B3X2GFoans1bgjidQp403I4C/vgaiXPA=;
        b=AXz8XIGLtwJPCGWp6I1UXazOL8aOZ7+V3yK1AOPxP+xt842AA96OaYdl4VPsUdCP4U
         OMT5dC3pRizQ2hsJ3j9uysguTc2iSBX3xy8z2btreCIidxwN8GIZoXano24CY4vpJ7cW
         uKeIZN+zcfKfdIRSk82I3gKwvYxJXZ/I+kYwlQVOCCFZViuFbC98FEOeul8ZXnf5HHFd
         wEk1HS8lw2lPiJPG4Kr0fcjwzRSfh2tEh2m8wIadaxc/qL7SqXDS68HReAMdoJAvMwBH
         7z0IQMUHz0BL8/iRa3wyYHBk4oq64q2nJC+n/VOvlmcZvMkOUFi3NzrQedAYDa/FkC3H
         /WHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750075163; x=1750679963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v7RJ7RnL5M/B3X2GFoans1bgjidQp403I4C/vgaiXPA=;
        b=VbpUgVhrBIJpp2jv2c1lXzzNV/qb/dRhF1MV3CIx4AqIpuSUDFVJdq31szoPgIR+qN
         9WOVlYu4G4dQ294ImqYW+XZTbQie0SjrdvTQW6HaImqvjjK9xWEZw6Y44xm65+i2jCt6
         CQNo4nO6J6yAcb2SNRMo9dxR1B6NhKimR3HfCkVDtSeoOdSxOUW1g5VLh7HjY9PYBMID
         NQgI9f9e6A31T1jj406QEk3TPj41xRTlcz498LUNrWy0q+dwRM6Exgo4ol+TMFCF5vu3
         qZZTjPM177zPiwG34FpjryFMvOOhdQ0BKhK5VdHqP5MwrspoxBrD5UZPfns0iuDOR41P
         vzLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqBQ+YxkMVihOGxOCx1on+YMylguLkBhgKwCq2ksv6dr/x/FF+x4bmY+pLi322tgb/YS5ViPiZlus=@lists.infradead.org
X-Gm-Message-State: AOJu0YxO5NRQs6nVC0x3uQy0ZB23O9R5F8c7ZOuL1A1TS7FjrPh6mX1z
	W8W55GPBRHSD6jb0GppvJH+QwTOqeKQ4xsh0a0OuRHKdMGE9eGD0UoB2zhCIqVFOA+s=
X-Gm-Gg: ASbGnctQ6gU0cY8kxEqqu99ZFbuxlPCKNr5J7aAlA7aSJJsdm7QCTr/2w5dudubc09j
	X3Hnq0MeEDkAyjoU3O6Xc64YH3AWhN5VkT+I03sar/fLmCRt1MKEtHMkTcUgN92bCqdBbUcD59P
	/eqxhC4PZLcmjd/gZV4ozPOYQpVCfSBmAQ6aR05gRnP4tKkj6bDujpub3uN4QPdtsrZ+1VJo/nT
	A14A5LLfjDnXnALsIG1sAKNPSU+l/ghYPxffl/dPaMB6yzecubqUVJTN+fZ2Iba+h3dgVmMmFqX
	XJI30hUz8jzHG3V+fRLHR4tHFprN35pNGJxG89VsxDU5Iz1SVRj7wkRQttb6A/ozZelZ56xv0w=
	=
X-Google-Smtp-Source: AGHT+IELLNm92LFRldfmnL4vF0QIZqp/HsDDpvz3MyBbTA9HBXfroUmvQynilHVSzS3W30Ny6doK4Q==
X-Received: by 2002:a05:600c:5908:b0:453:827:d0b1 with SMTP id 5b1f17b1804b1-4533b235e16mr61208595e9.2.1750075162941;
        Mon, 16 Jun 2025 04:59:22 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a579808c24sm6198786f8f.43.2025.06.16.04.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 04:59:22 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [kvm-unit-tests v3 0/2] riscv: Add double trap testing
Date: Mon, 16 Jun 2025 13:58:58 +0200
Message-ID: <20250616115900.957266-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_045925_162844_286E479E 
X-CRM114-Status: GOOD (  11.33  )
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
CiAgLi9yaXNjdi1ydW4gcmlzY3YvaXNhLWRibHRycC5mbGF0CgotLS0KCnYzOgogLSBSZXR1cm4g
YW4gZXJyb3Igb25seSBpZiBTU0UgZXZlbnQgd2Fzbid0IHVucmVnaXN0ZXJlZCBzdWNjZXNzZnVs
bHkKCnYyOgogLSBVc2UgV1JJVEVfT05DRS9SRUFEX09OQ0UgZm9yIHNoYXJlZCB2YXJpYWJsZXMK
IC0gUmVtb3ZlIGxvY2tpbmcgZmxhZyBmb3IgbGFzdCB0ZXN0CiAtIEZpeCBhIGZldyB0eXBvcwog
LSBTa2lwIGNyYXNoIHRlc3QgaWYgZW52IHZhciBET1VCTEVfVFJBUF9URVNUX0NSQVNIIGlzbid0
IHNldAogLSBTa2lwIGNyYXNoIHRlc3QgaWYgU1NFIGV2ZW50IHVucmVnaXN0ZXJpbmcgZmFpbGVk
CiAtIFJlbW92ZSBTRFQgY2xlYXJpbmcgcGF0Y2gKIC0gRml4IHdyb25nIGNoZWNrIHVzaW5nIHJl
dC52YWx1ZSBuc3RlYWQgb2YgcmV0LmVycm9yCgpDbMOpbWVudCBMw6lnZXIgKDIpOgogIGxpYi9y
aXNjdjogZXhwb3J0IEZXRlQgZnVuY3Rpb25zCiAgcmlzY3Y6IEFkZCBJU0EgZG91YmxlIHRyYXAg
ZXh0ZW5zaW9uIHRlc3RpbmcKCiByaXNjdi9NYWtlZmlsZSAgICAgICAgICAgIHwgICAxICsKIGxp
Yi9yaXNjdi9hc20vY3NyLmggICAgICAgfCAgIDEgKwogbGliL3Jpc2N2L2FzbS9wcm9jZXNzb3Iu
aCB8ICAxMCArKwogbGliL3Jpc2N2L2FzbS9zYmkuaCAgICAgICB8ICAgNSArCiBsaWIvcmlzY3Yv
c2JpLmMgICAgICAgICAgIHwgIDIwICsrKysKIHJpc2N2L2lzYS1kYmx0cnAuYyAgICAgICAgfCAy
MTAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHJpc2N2L3NiaS1md2Z0
LmMgICAgICAgICAgfCAgNDkgKysrLS0tLS0tCiByaXNjdi91bml0dGVzdHMuY2ZnICAgICAgIHwg
ICA0ICsKIDggZmlsZXMgY2hhbmdlZCwgMjY1IGluc2VydGlvbnMoKyksIDM1IGRlbGV0aW9ucygt
KQogY3JlYXRlIG1vZGUgMTAwNjQ0IHJpc2N2L2lzYS1kYmx0cnAuYwoKLS0gCjIuNDkuMAoKCi0t
IAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
