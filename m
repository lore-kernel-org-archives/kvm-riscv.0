Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5CFC021B3
	for <kvm-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 12:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MZxwehz5ZSlGWZ166zaxDQgVmSG4I5MNs6zMS5V/fzc=; b=DOXHsv57Zt5i55
	vl5NICcBiEM3geay04se1AZgmqjLEiVnekPxfgrclFijXVtJZvCKcEWuKV3JeRJgAJQcoV/vB3ZHg
	fLzKbKb4fE0cnXrnmMnokypGh1Uec7sboZY/+9dOK2iYaJbky6cxfMdyeSgzbmJ5X1ASKd9aN5oq2
	tPkiSeczuokEyv4ApK+wo7rjDG22+03xDOq0hhfpObvaDvk6HoIO59sjWWZ0g27ZmPA4Zc5GrtJYJ
	VsQuARk01M6Pc1of4++ER9AkNCoMvhJthxAK3XiNvf13Biiq4YcRyd+8K3RdcI79mWAWNVVLolDVt
	nQddp/xNP/kDw6ANEq4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlS6u-00000005TEZ-0Ab2;
	Fri, 21 Feb 2025 12:26:28 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlR52-00000005JZx-1R48
	for kvm-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 11:20:29 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38e1cad9e27so100316f8f.1
        for <kvm-riscv@lists.infradead.org>; Fri, 21 Feb 2025 03:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740136826; x=1740741626; darn=lists.infradead.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVNBNWqXlEkHBpelyjOliwzjP+Z7atB2V59Z13O6URI=;
        b=DIwK6E4haqCplijF6uFw9V0N1gK9p4x3aw3O29DU4eUr0HgtxPvQTcHwVc5L3qmaPY
         oOSJTDLk70H0yt3wKDDCJVztL/Mo++awGPe2OXppcUviRopm6Xg+E/52j10CH3C2ODRA
         JLNuQZdizyB/t0it9DDX9Xpsy1e09+DJFLgol+sGbg93OeOxnzOVihkOstLlMklr5aM1
         jDad9koEJKbXbiNSJLSEsGELB7aTD4Q7048kG3Fj2VRQ5m2IWMo7HK9aCz8vzU/jr52V
         nUyJbjlvWoC1zQHuLUWxB9wklFPI5mylJ6Lm+fk0D88hzjphTUz+zP/MCBsq/1ATNCMf
         yp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740136826; x=1740741626;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HVNBNWqXlEkHBpelyjOliwzjP+Z7atB2V59Z13O6URI=;
        b=tr00q6qXatXPs+zW4WrGiKhpY/ayhH+BMwxidNqkdh2jtD9FrxjeNAGrTOU6cnUOCQ
         r+3RyOm9KlfFrbCOIhdZdPN+TqZDpWVqOH093Da+Rfgr5V+gAufzrw/88Czp5aUC5YOO
         uQNtN/YPOeEWfNvXnARkqdNw1m89B8rME6MonMFAheYGWDFIzQWE1Nv7UqE0lSM1EVFF
         vvXfX/jOJv0K2Dc1G9yFotl+CLrjNxtuoMre2KL3lEy34C3TUiS/6OskQ7C8UP6E308L
         InHnt6BHLbDbG0eROzCGGpBxQ7/SPaaYwLDyLt8qfboRXR6kHACqq5xSoN9D2v21QBSo
         95EQ==
X-Forwarded-Encrypted: i=1; AJvYcCW26MC8TpoF806PUusPJGUenLuOXeY3jstNQrGj18HCzlJQ9wfaszHdqWaTaxcvNj5lKoEounm175o=@lists.infradead.org
X-Gm-Message-State: AOJu0YzCKFFZsYfXQVUztUosKT9Ywc0gZuWRelm2CoofjiSCipwjBNxR
	Ak5oQzYcJiuG3ixtw0IvItfafqdK5dgJIkuGOAq8ZzDOwXd4C5Em/1IfnGEVa14=
X-Gm-Gg: ASbGncvCoKXaJpT9xjywV2qAhWqLIOWuvTPwjEWD9upzLXcmClg37oyoHHgg5tJuH85
	ImtecNuVyZVs1gyWzx2fGith7tXNEeE2dxzNCUEPFiDtXSOFkgwJ/MvpgN7FfBjVtUQQjTBKb7H
	NmnoWB9+cKyvHZcSNmRSrYDj9KQTHo0PsfJw+piafIcc8/kwuKWgMF881X2dKFhtFtgAHMrUrtH
	TiIdst6nUxgC03pY+uIwxDCwbk8iB35NO9CggtNRSHAwNroQHh+Yd3iRxSpSAT5tJdMrPU6SmZv
	HKMvHlz46wlFAyMp37VgYhiepcgSks17oQ7O5llRgeaTsPE/FKK6f+/ApgT9nqsfttvmo2CApCG
	QEhNBnMlpG4rkEic=
X-Google-Smtp-Source: AGHT+IH7K+hzKcKXQTAM1MJlY9T9odHfHdYNa2eoNCcz78onWDZURLkgur4LeY451LSe8tRmqDN2LQ==
X-Received: by 2002:a05:6000:2a0c:b0:38d:cab2:91dd with SMTP id ffacd0b85a97d-38f6e95f74bmr899043f8f.6.1740136825868;
        Fri, 21 Feb 2025 03:20:25 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-c955-d4da-b5fa-7bb3.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:c955:d4da:b5fa:7bb3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d94acsm23492868f8f.75.2025.02.21.03.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 03:20:25 -0800 (PST)
Mime-Version: 1.0
Date: Fri, 21 Feb 2025 12:20:25 +0100
Message-Id: <D7Y30THD6TSI.113LHMD3DBBCP@ventanamicro.com>
Cc: <ajones@ventanamicro.com>, <kvm-riscv@lists.infradead.org>,
 <kvm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <atishp@atishpatra.org>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
To: "BillXiang" <xiangwencheng@lanxincomputing.com>, <anup@brainfault.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH v2] riscv: KVM: Remove unnecessary vcpu kick
References: <20250221104538.2147-1-xiangwencheng@lanxincomputing.com>
In-Reply-To: <20250221104538.2147-1-xiangwencheng@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_032028_408535_B77A87EB 
X-CRM114-Status: UNSURE (   8.71  )
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

MjAyNS0wMi0yMVQxODo0NTozOCswODowMCwgQmlsbFhpYW5nIDx4aWFuZ3dlbmNoZW5nQGxhbnhp
bmNvbXB1dGluZy5jb20+Ogo+IFJlbW92ZSB0aGUgdW5uZWNlc3Nhcnkga2ljayB0byB0aGUgdkNQ
VSBhZnRlciB3cml0aW5nIHRvIHRoZSB2c19maWxlCj4gb2YgSU1TSUMgaW4ga3ZtX3Jpc2N2X3Zj
cHVfYWlhX2ltc2ljX2luamVjdC4KPgo+IEZvciB2Q1BVcyB0aGF0IGFyZSBydW5uaW5nLCB3cml0
aW5nIHRvIHRoZSB2c19maWxlIGRpcmVjdGx5IGZvcndhcmRzCj4gdGhlIGludGVycnVwdCBhcyBh
biBNU0kgdG8gdGhlbSBhbmQgZG9lcyBub3QgbmVlZCBhbiBleHRyYSBraWNrLgo+Cj4gRm9yIHZD
UFVzIHRoYXQgYXJlIGRlc2NoZWR1bGVkIGFmdGVyIGVtdWxhdGluZyBXRkksIEtWTSB3aWxsIGVu
YWJsZQo+IHRoZSBndWVzdCBleHRlcm5hbCBpbnRlcnJ1cHQgZm9yIHRoYXQgdkNQVSBpbgo+IGt2
bV9yaXNjdl9haWFfd2FrZW9uX2hnZWkuIFRoaXMgbWVhbnMgdGhhdCB3cml0aW5nIHRvIHRoZSB2
c19maWxlCj4gd2lsbCBjYXVzZSBhIGd1ZXN0IGV4dGVybmFsIGludGVycnVwdCwgd2hpY2ggd2ls
bCBjYXVzZSBLVk0gdG8gd2FrZQo+IHVwIHRoZSB2Q1BVIGluIGhnZWlfaW50ZXJydXB0IHRvIGhh
bmRsZSB0aGUgaW50ZXJydXB0IHByb3Blcmx5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQmlsbFhpYW5n
IDx4aWFuZ3dlbmNoZW5nQGxhbnhpbmNvbXB1dGluZy5jb20+Cj4gLS0tCj4gdjI6IFJldmlzZSB0
aGUgY29tbWl0IG1lc3NhZ2UgdG8gZW5zdXJlIGl0IG1lZXRzIHRoZSByZXF1aXJlZCAKPiAgICAg
c3RhbmRhcmRzIGZvciBhY2NlcHRhbmNlCgpOaWNlLCB0aGFua3MuCgpSZXZpZXdlZC1ieTogUmFk
aW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+CgotLSAKa3ZtLXJpc2N2IG1h
aWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
