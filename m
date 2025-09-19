Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B859BCAC592
	for <kvm-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 12:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ftEpqH2NYEdAdMMAyvQj12/K2O/3jK1HoBNtNYSZIjs=; b=DmXC+0QfZp+79H
	QrqHZmWjA0IAWjjmSh+ULG8szWN+RscFmjBFc+siMy1FxJTLt8BZw4R/JJ0ExroOIShMnU+O2/GBM
	rVik1OXRrmegI5LrLHEX6EDo2j6993hWxFuLKdJep9Gl/5d9A4E4Wa4nWianmvyKKLNc5QAb3L9T/
	UsQfCvKrOD2UcWUav2aSetpQdk1D1HbsjoRIAxaW2Zxe9s9tw3f2uPMt7WBCJlo+F+3qiMVW7SsU/
	w/1VE1yP4RChVkijrKjEDh4Hn/SP8BO7Y6kGwF5flU5UbVIyfQlTiDKIzh1Vfqhg5e5LAjH7yYLc4
	mZGgakIZZ5yooZgt/92A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzZyX-00000002mcX-3Fz6;
	Fri, 19 Sep 2025 12:12:29 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzZyU-00000002ma0-2NjF
	for kvm-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 12:12:28 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-329a41dc2ebso1604211a91.3
        for <kvm-riscv@lists.infradead.org>; Fri, 19 Sep 2025 05:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758283946; x=1758888746; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2HMMNKqDgzt194tG8vLKUMKuY47t2DmDtqHxNeA0cA=;
        b=OC1Ls03Pbq0rJrnZbWRYx8Zd96SGL8Yr+HqW4M6q7ZhpqYkWWKjaJvezfFebV/doRa
         DDveDWvO+4tAM2xnVICfCS4MN8JmCCQjz5dG1WScM8EvpnMeTwkJ8W1ObrXSxFuBPLY9
         tl8pEzIpxaAc4uDLtVC+jKeHwwvPv6qjaWwwdY55biFr01gmqxRy+K4o+yXzGAXt1Rr4
         BZ6jLdS53YXPJEpGGw6xjGD1foACNG2eP419PqJ/nHTFR3Zn1OOVwgxqE/MMQTRGxksy
         Y21lxTYLPl+TL2dPgkZxJdIsNG1P9WGGSpujFdAFXkMuk0x57gwgCqR/tAKYiMJ4veMU
         NfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758283946; x=1758888746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t2HMMNKqDgzt194tG8vLKUMKuY47t2DmDtqHxNeA0cA=;
        b=YEXuyn20zGOB1rXTahHe0Ruu8EAF+SF05RWmeZYzZU70HO8povikIuMGrbfMrjl5Oa
         ASvnoI2wSuwV0xS68J/u0oNkf0hB2PJGCyVO3helk9s3O/Mbfw3NNdTPnV8y2Qy1/bB3
         t+lsg9jWkqUf9s9v88YpgqPkCnlhA1t1ktbNkrN7oWvzuCRtMz6fwnX+E3ZtPFkPyCWR
         lRV3vtr/4Tj062F90muR++kLyc+9dqnKG82y+7U26XFnlmSEjITe/JyUYH7E8oMFY+iP
         Oxvvf4OMlqWGZ7bqi6L9fFC3xPHRUKcQDwaEBJ0mLZycMQFJy53sjA2gFxSwfY90fJqv
         4D+A==
X-Forwarded-Encrypted: i=1; AJvYcCWniPyFDcNCGCwAzMKNPcEQ8QsDaPrn5gA9emNMZYSZYssmDp0sfBDun9YYIlVoWOmxiLLM7kwV6ho=@lists.infradead.org
X-Gm-Message-State: AOJu0YzAsHO16I2aNRm1G1LMBqvqKNAdMQDaAdoiOUh9FyQkv9+kXEMF
	abbwp7Dm7p88yacYbU2yZ+YRTg+SrSEoDsmlrLOI8fjWl305gfPH1rqxY7gFwtpyQ7//IxCbg88
	wkGJYW1WhMAMI8PaiPVYT52TU8gqZAEfVLkw0/GXi4YcKpMZVpynnJVz4Kw==
X-Gm-Gg: ASbGncu2aqPBX6M2DYA3B+Oz1dZPwgNcfXNEjwf391DQQBfLVlLSPiHUTjoTtCUqx6h
	sYOGwp0SIDXOEMYzbw40jsUuCnL9Dq95GwkrSvF+kvnzz3jDB5YsSo4zfy1EnON/dwt68Tke7wh
	rXJE5Jf/wuS6fVAvCMYlBBHFcqFUXtRkSrcbWBZ2DoyRkNox+yleJAT34JI9K+rRCGdkvuPFbHe
	ECY/MW+/CNZp1fKKEdHkxD7WTqQmvbKoml8uFZ5gU1C4Jq8yU5N
X-Google-Smtp-Source: AGHT+IGm4y1poVxGUSiB4FXU7penSJROWpZ9IBJ4RsACGtjYuoj82wxnXamn8PKPxeWN3xAf3wDL9CKqcfW9WQHchPw=
X-Received: by 2002:a17:90a:d40d:b0:32e:3f93:69f5 with SMTP id
 98e67ed59e1d1-3309836a969mr3636748a91.26.1758283945619; Fri, 19 Sep 2025
 05:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250919073714.83063-1-luxu.kernel@bytedance.com>
 <aM0qlTNPiaQRY2Nv@andrea> <CAPYmKFsP+=S56Cj2XT0DjdvBT_SY84moM4LVeqxHTVWbtq4EVw@mail.gmail.com>
 <CAPYmKFsV_ZPifJBtvPOdqM6_Mzhac9A4-PH9zt8TirOqAwKGhw@mail.gmail.com> <aM05J6FU0xG3SBzR@andrea>
In-Reply-To: <aM05J6FU0xG3SBzR@andrea>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Fri, 19 Sep 2025 20:12:14 +0800
X-Gm-Features: AS18NWC1LrBbaCsNeBFlqUXUWaqY8b6JknWKL06v5j39bQDtG4KDuo4wYFErj1E
Message-ID: <CAPYmKFunbrughXdG9Fpum6bxHVu9jmjQdgLVSJ_JA9z+GDsZbA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 0/8] riscv: Add Zalasr ISA extension support
To: Andrea Parri <parri.andrea@gmail.com>
Cc: corbet@lwn.net, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, will@kernel.org, peterz@infradead.org, boqun.feng@gmail.com, 
	mark.rutland@arm.com, ajones@ventanamicro.com, brs@rivosinc.com, 
	anup@brainfault.org, atish.patra@linux.dev, pbonzini@redhat.com, 
	shuah@kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, apw@canonical.com, joe@perches.com, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_051226_610330_874A1464 
X-CRM114-Status: GOOD (  18.70  )
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

T24gRnJpLCBTZXAgMTksIDIwMjUgYXQgNzowNuKAr1BNIEFuZHJlYSBQYXJyaSA8cGFycmkuYW5k
cmVhQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiA+ID4gPiAobm90IGEgcmV2aWV3LCBqdXN0IGxvb2tp
bmcgYXQgdGhpcyBkaWZmIHN0YXQpIGlzIGNoYW5naW5nIHRoZSBmYXN0cGF0aAo+ID4gPiA+Cj4g
PiA+ID4gICByZWFkX3VubG9jaygpCj4gPiA+ID4gICByZWFkX2xvY2soKQo+ID4gPiA+Cj4gPiA+
ID4gZnJvbSBzb21ldGhpbmcgbGlrZQo+ID4gPiA+Cj4gPiA+ID4gICBmZW5jZSBydyx3Cj4gPiA+
ID4gICBhbW9kYWRkLncKPiA+ID4gPiAgIGFtb2FkZC53Cj4gPiA+ID4gICBmZW5jZSByLHJ3Cj4g
PiA+ID4KPiA+ID4gPiB0bwo+ID4gPiA+Cj4gPiA+ID4gICBmZW5jZSBydyxydwo+ID4gPiA+ICAg
YW1vYWRkLncKPiA+ID4gPiAgIGFtb2FkZC53Cj4gPiA+ID4gICBmZW5jZSBydyxydwo+ID4gPiA+
Cj4gPiA+ID4gbm8gbWF0dGVyIFphbGFzciBvciAhWmFsYXNyLiAgU2ltaWxhcmx5IGZvciBvdGhl
ciBhdG9taWMgb3BlcmF0aW9ucyB3aXRoCj4gPiA+ID4gcmVsZWFzZSBvciBhY3F1aXJlIHNlbWFu
dGljcy4gIEkgZ3Vlc3MgdGhlIGNoYW5nZSB3YXMgbm90IGludGVudGlvbmFsPwo+ID4gPiA+IElm
IGl0IHdhcyBpbnRlbnRpb25hbCwgaXQgc2hvdWxkIGJlIHByb3Blcmx5IG1lbnRpb25lZCBpbiB0
aGUgY2hhbmdlbG9nLgo+ID4gPgo+ID4gPiBTb3JyeSBhYm91dCB0aGF0LiBJdCBpcyBpbnRlbmRl
ZC4gVGhlIGF0b21pYyBvcGVyYXRpb24gYmVmb3JlCj4gPiA+IF9fYXRvbWljX2FjcXVpcmVfZmVu
Y2Ugb3Igb3BlcmF0aW9uIGFmdGVyIF9fYXRvbWljX3JlbGVhc2VfZmVuY2UgY2FuCj4gPiA+IGJl
IGp1c3QgYSBzaW5nbGUgbGQgb3Igc2QgaW5zdHJ1Y3Rpb24gaW5zdGVhZCBvZiBhbW9jYXMgb3Ig
YW1vc3dhcC4gSW4KPiA+ID4gc3VjaCBjYXNlcywgd2hlbiB0aGUgc3RvcmUgcmVsZWFzZSBvcGVy
YXRpb24gYmVjb21lcyAnc2QucmwnLCB0aGUKPiA+ID4gX19hdG9taWNfYWNxdWlyZV9mZW5jZSB2
aWEgJ2ZlbmNlIHIsIHJ3JyBjYW4gbm90IGVuc3VyZSBGRU5DRS5UU08KPiA+ID4gYW55bW9yZS4g
VGh1cyBJIHJlcGxhY2UgaXQgd2l0aCAnZmVuY2UgcncsIHJ3Jy4KPgo+IEJ1dCB5b3UgY291bGQg
YXBwbHkgc2ltaWxhciBjaGFuZ2VzIHlvdSBwZXJmb3JtZWQgZm9yIHhjaGcgJiBjbXB4Y2hnOiB1
c2UKPiAuQVEgYW5kIC5STCBmb3Igb3RoZXIgYXRvbWljIFJNVyBvcGVyYXRpb25zIGFzIHdlbGws
IG5vPyAgQUZBSUNTLCB0aGF0IGlzCj4gd2hhdCBhcm02NCBhY3R1YWxseSBkb2VzIGluIGFyY2gv
YXJtNjQvaW5jbHVkZS9hc20vYXRvbWljX3tsbF9zYyxsc2V9LmggLgoKSSBzZWUuIEkgd2lsbCBz
dHVkeSB0aGUgaW1wbGVtZW50YXRpb24gb2YgQVJNIGFuZCByZWZpbmUgbXkgcGF0Y2guIFRoYW5r
cyBhIGxvdC4KCkJlc3QgcmVnYXJkcywKWHUgTHUKCj4KPiAgIEFuZHJlYQo+Cj4KPiA+IFRoaXMg
aXMgYWxzbyB0aGUgY29tbW9uIGltcGxlbWVudGF0aW9uIG9uIG90aGVyIGFyY2hpdGVjdHVyZXMg
d2hvIHVzZQo+ID4gYXEvcmwgaW5zdHJ1Y3Rpb25zIGxpa2UgQVJNLiBBbmQgeW91IGNlcnRhaW5s
eSBhbHJlYWR5IGtuZXcgaXR+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2t2bS1yaXNjdgo=
