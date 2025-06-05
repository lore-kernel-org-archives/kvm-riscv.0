Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85693C5B543
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 06:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rttmdQjyOgKdFEusSHvVxnuXzFYVx3XrG9tQsb8kZrs=; b=FHmgtDlQF1l6QU
	pCt2i1lHa2kU/ehGNUwIjdynHAj5UNJz1TDjzxlc3nejj/0FVUbaGJ++MyMw6WES3Z5DoWNqkNY6X
	iIKiXnbRQ38pka7UaTeqwRIneOzZ/g9245DxCdDoyc7RbSt1bFcds8ruGN7wxsw4P3Aq9243bHy2G
	Q2s68qn7chRVmgnE8m6bIO1FSQQP8cCahWTu1HXnn07TBMSWlDrYmTv+4NkXwWp7OZBM0KziimLy+
	WZ3BhA0DyCDNMFJs+CjsbOkRnsXDKDfQ9v89iz1TtUvO8D4rZtw2Ia7xLhT/KpF1fh6js+lg1jKQQ
	K5iJs0iext4M/8jv1o7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3so-0000000Eosm-1DAp;
	Thu, 05 Jun 2025 06:15:22 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3sg-0000000EolY-1E1S
	for kvm-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 06:15:21 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3124f18c214so517322a91.2
        for <kvm-riscv@lists.infradead.org>; Wed, 04 Jun 2025 23:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749104113; x=1749708913; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6EY1voNzcSK9ojB16bH1YicliuGIt5A/zH/wdqEteM=;
        b=cxEQ0urYJ5EKakU83FXBEgxYu3ZOWJFf3gDHh13UmY40XiliVdBXFPTJOz49TBq2MH
         nTgHqCeaUUro5ONdWtyim0g6YtUKh0vX+j4P5puj5UjPt6zvzkn0rqC/WYHBPR06wjKk
         zv6gr9qW3vxAaWwLxcLnuzmHKiMqU9xePdKBg6fqz3CYxJX75t95rLluoghd46Q1vNt8
         OcdXpDTlz6fVOlUWPSPx2gMu9tzK/1Vals2VraC8hN6X7dweEw/xSPI+Va7Yj0t8Zskc
         bcurXHMD1J7hYsCTE30JrqrgkNy+5u+b0thJD+KXJHQR+MX8lFiZS9m9yqU+lyvCGbJq
         qZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749104113; x=1749708913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z6EY1voNzcSK9ojB16bH1YicliuGIt5A/zH/wdqEteM=;
        b=Wtl81hbqKOKkue2uZbZXOLcJMs2Hgk9Rx2MVSUObXFIf0hUqHJ6bQWe3kUapga9ymI
         h6Ae/CV3eRTcE6pXz/qivNH8Hfzz/NQ57AT4hstk7h3ZCbycQZrY9QfQKih66t9SGbsN
         aGYQgzAUIY3KCp93TQBmDduhbZGTfXXjcjgS/kAws53EaSX+or3Aymf0NCjZLFIzIPm5
         UrvdL422vbscqaND4QxMhlIX5fxPjwXO6Cxe/SmyM6hYnVpSYaddVMnWQUj1/hndgL1x
         HdxTNplvupNYFvDSNlyWRjNSaq+TpXF3degB1rHQZGXMC9Ca7ajaGF7N8vo8Nln4Cedx
         Ih0w==
X-Forwarded-Encrypted: i=1; AJvYcCUOmTwUY50jVX+yi99hyZzuaYLebxJNwecYDaAdX42TWfS+/o2fCk/+pTAalmXSNYTQPIfx56zhWm8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz76uXEtUSglWZ2dxi1ztbQH2CXs7H62ROyF3g8RJ1N/vEposOn
	e5fXnnwyvWm8u4GG/nNrVbhKEADxeQQqRSDOVkBJro3tOlLw9yApJI2X+oWU9tJy3y4=
X-Gm-Gg: ASbGncsEBrXHEgf17Es0w5CcUkNiX/+Mx5OlWqTzTA+OwGgQp3y08/rUaGcUjmunLKn
	amCmQwbnJgXjDzS0rObFpCc+MpRGZD0Q3NqM6B1UEUtsh70l77VLG/Yr7xHNh54b6UEbmE5GlhP
	O6sxNWLzhxivk8cZ6sBD0+ZIgfUAut2jcDrQASMzvaTr5bLSrvxhfftbXRyXu8mgaqeAZwI9AtD
	X9bBJeuvMXc6a2NWCJzpHMRMomS23mk8VRUjVOlfB0y7GPBUPrXFu9KuM7J7wB6b1puyPaZMBPH
	doS8xFhy1Xmz+ydkCCrIekQm+/8KALJ51RI2TtiYEC3IJ7WvpU7LftbkaImaurS5tB/48aQk6n0
	GPWld/x1cN97tVXe5
X-Google-Smtp-Source: AGHT+IFFxi4gniZBsMh1uNNeEYBLb4/KPrhz9tn6tI1ZmsRYmgudY+gvcTjARMukQYkeSUEQVSE1LA==
X-Received: by 2002:a17:90b:164b:b0:312:959:dc42 with SMTP id 98e67ed59e1d1-3130cd15a69mr8793286a91.11.1749104113144;
        Wed, 04 Jun 2025 23:15:13 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132c0bedc7sm716026a91.49.2025.06.04.23.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:15:12 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 02/13] RISC-V: KVM: Don't treat SBI HFENCE calls as NOPs
Date: Thu,  5 Jun 2025 11:44:47 +0530
Message-ID: <20250605061458.196003-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605061458.196003-1-apatel@ventanamicro.com>
References: <20250605061458.196003-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_231514_329793_FB47E91E 
X-CRM114-Status: UNSURE (   9.86  )
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

VGhlIFNCSSBzcGVjaWZpY2F0aW9uIGNsZWFybHkgc3RhdGVzIHRoYXQgU0JJIEhGRU5DRSBjYWxs
cyBzaG91bGQKcmV0dXJuIFNCSV9FUlJfTk9UX1NVUFBPUlRFRCB3aGVuIG9uZSBvZiB0aGUgdGFy
Z2V0IGhhcnQgZG9lc27igJl0CnN1cHBvcnQgaHlwZXJ2aXNvciBleHRlbnNpb24gKGFrYSBuZXN0
ZWQgdmlydHVhbGl6YXRpb24gaW4tY2FzZQpvZiBLVk0gUklTQy1WKS4KCkZpeGVzOiBjN2ZhM2M0
OGRlODYgKCJSSVNDLVY6IEtWTTogVHJlYXQgU0JJIEhGRU5DRSBjYWxscyBhcyBOT1BzIikKU2ln
bmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Ci0tLQogYXJj
aC9yaXNjdi9rdm0vdmNwdV9zYmlfcmVwbGFjZS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHVfc2JpX3JlcGxhY2UuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3JlcGxhY2Uu
YwppbmRleCA5NzUyZDJmZmZmNjguLmIxN2ZhZDA5MWJhYiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNj
di9rdm0vdmNwdV9zYmlfcmVwbGFjZS5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3Jl
cGxhY2UuYwpAQCAtMTI3LDkgKzEyNyw5IEBAIHN0YXRpYyBpbnQga3ZtX3NiaV9leHRfcmZlbmNl
X2hhbmRsZXIoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuCiAJY2Fz
ZSBTQklfRVhUX1JGRU5DRV9SRU1PVEVfSEZFTkNFX1ZWTUFfQVNJRDoKIAkJLyoKIAkJICogVW50
aWwgbmVzdGVkIHZpcnR1YWxpemF0aW9uIGlzIGltcGxlbWVudGVkLCB0aGUKLQkJICogU0JJIEhG
RU5DRSBjYWxscyBzaG91bGQgYmUgdHJlYXRlZCBhcyBOT1BzCisJCSAqIFNCSSBIRkVOQ0UgY2Fs
bHMgc2hvdWxkIHJldHVybiBub3Qgc3VwcG9ydGVkCisJCSAqIGhlbmNlIGZhbGx0aHJvdWdoLgog
CQkgKi8KLQkJYnJlYWs7CiAJZGVmYXVsdDoKIAkJcmV0ZGF0YS0+ZXJyX3ZhbCA9IFNCSV9FUlJf
Tk9UX1NVUFBPUlRFRDsKIAl9Ci0tIAoyLjQzLjAKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlz
dAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
