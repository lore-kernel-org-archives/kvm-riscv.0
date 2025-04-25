Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B667C369C2
	for <kvm-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 13:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DySkBaQAuuSeDmFp5lqZvvST2wBaJ3Vn5WaaW0GvG8E=; b=laZOyEFTn7MmqO
	jiR8NyFDG6zIV9+oBNkOcEYakhB6uIHfEVL83DjZAYC2BwTh8PnJIrYGo8IAi7roXrXj+76gwmst0
	IKGES2Fq4qxeoEdDEqV4ghrVPbZncHUm1ls0AlSoFa0K6qkZqd0loCh4N4v7x2twHoSMPSqEQLcLe
	m5BYgyYAP8gbJc2TcYEujIKut+PZUTtfLYrV4xi3A8NCJ6N5GdiSgxMVK4YxsWGAtOET/3R1eaShj
	w/BEcgUamu2HgW8c7ao2RnqXJ0gwdHNBrRfOccOx8++F1EIK6cHvz92CaIRousHGWHEcRZgZGTVRx
	BjGPHVWqhbd3iewamuRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8J9K-0000000HHvN-0qhg;
	Fri, 25 Apr 2025 13:31:26 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IKM-0000000H95N-3pFB
	for kvm-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 12:38:48 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3d5e2606a1bso19468545ab.0
        for <kvm-riscv@lists.infradead.org>; Fri, 25 Apr 2025 05:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745584726; x=1746189526; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y49ecCcPZ27vKY56UjG6VNDfh5EOeWUeZzzvy6PanTw=;
        b=25sbKMOiooZcJqI+fzWXANcwrRpOp2aQN8XL9PoJ9+vKxd2BgUnjyGi+89i3QBp6LV
         7lOn3RMMLwl+T4kTV6age6Zd6x3aT5pM+b1Kg7UI+KwnjBl95ChNA9+26y/ghZntvLP3
         eWkQV0y/FHjxziygJrdUXzS5CE5C4npeO/fPyY2v7TP8LhhNVpSFNx05bWNOgwxa0cm1
         rbOnxPojgq+HTPuyYTAlia3RDFMRBFpBwxTp5LdgIyevQ0TLK3moagh6sks0E5a0YIfU
         kX1Q96+79ygxK0K4tWUgfskQBkV/SYs1lvmkGQIbasORgsyH+BhlrWfcR5nTYzWMfCVU
         S47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745584726; x=1746189526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y49ecCcPZ27vKY56UjG6VNDfh5EOeWUeZzzvy6PanTw=;
        b=bazP1BdZ4ExqsYNb71SIYAvQgtQZxRdfPmcybw9SW8Mi98+/0hjRn2eCH7n5dJJY3Q
         wL/itoOZ/2ZhXZM4TeOglIAfp80xuSGHQRxumaGDpV07XSDuMvQffVDuT6pwHGQiihJG
         0SBl+0UBQM0luzu1QWVvxO89mvrhCjgN7vMO9I04C7L9cK73UWQXXPmqp/8FogyAoky/
         DQl7VHtEDUr3cIs0D1MQswuyYQ5acujaBjC1nQmctave+8WAnlwF3xCne/2d7rxofbPn
         18616HV8c2rZBX9VEEoR889ygwe8SxS/S63qtO8d4v4DKfhUI6+NsVSGpUWY9H8BCp+X
         al9Q==
X-Gm-Message-State: AOJu0YzoT6NRakVodNJlLJzZWQIYxuX7didujMrymELvAeJ5ydZWPcHw
	jFEIUmpIf4SCEOc9LsLa5QFfylAtGKG3ha7ya9j/QKr7jmEfqDRXl7ylQ3u6hrdI7UL4FIJG3ar
	f+D0mqaZHKMnmuFlS9zhcpnv8PZIiXMdnHozvyA==
X-Gm-Gg: ASbGncsxG5a0f3J0HtWie7P+Vhq9wHpKWr00p5cyUgaJN5QCXA/PmBqBN7FrdiGuRIG
	tPDyhTXTpZbKSeGkkJfOhc4t8juQr8VMZUwoTeleda56+GOAxP9FaPJ+UPj9s5T1ExCuZsUfukK
	iXf1qd6eIZ9rNJXYfZvI+6FjWHbmbXQRyOvQ==
X-Google-Smtp-Source: AGHT+IHCBpc2B5Wy9lcw08NfHNFF6DJA1zf4wJ9kwK39XfuRau2F7l0ThkxP7bLnPHEwO5HGzNURDb7ye8N+KXdSdhA=
X-Received: by 2002:a05:6e02:160c:b0:3a7:88f2:cfa9 with SMTP id
 e9e14a558f8ab-3d93b46c840mr18166585ab.11.1745584725718; Fri, 25 Apr 2025
 05:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com> <20250403112522.1566629-8-rkrcmar@ventanamicro.com>
In-Reply-To: <20250403112522.1566629-8-rkrcmar@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 25 Apr 2025 18:08:32 +0530
X-Gm-Features: ATxdqUGBDZlnKKA6uFKMGKbX7_uvZC9RQt2w-oNtOWxKHL92YM2ym7Hd58gV9nQ
Message-ID: <CAAhSdy0+C34zZbYR3_B9x6xHihwfLxeTBOfrdRfLRjFUN=78gA@mail.gmail.com>
Subject: Re: [PATCH 5/5] KVM: RISC-V: reset smstateen CSRs
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_053846_952503_A6A7CC7E 
X-CRM114-Status: GOOD (  13.78  )
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

T24gVGh1LCBBcHIgMywgMjAyNSBhdCA1OjAy4oCvUE0gUmFkaW0gS3LEjW3DocWZIDxya3JjbWFy
QHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gTm90IHJlc2V0dGluZyBzbXN0YXRlZW4gaXMg
YSBwb3RlbnRpYWwgc2VjdXJpdHkgaG9sZSwgYmVjYXVzZSBWVSBtaWdodAo+IGJlIGFibGUgdG8g
YWNjZXNzIHN0YXRlIHRoYXQgVlMgZG9lcyBub3QgcHJvcGVybHkgY29udGV4dC1zd2l0Y2guCj4K
PiBGaXhlczogODFmMGYzMTRmZWM5ICgiUklTQ1Y6IEtWTTogQWRkIHNzdGF0ZWVuMCBjb250ZXh0
IHNhdmUvcmVzdG9yZSIpCj4gU2lnbmVkLW9mZi1ieTogUmFkaW0gS3LEjW3DocWZIDxya3JjbWFy
QHZlbnRhbmFtaWNyby5jb20+CgpUaGlzIHNob3VsZCBiZSB0aGUgZmlyc3QgcGF0Y2ggb2YgdGhl
IHNlcmllcyB3aGljaCBjYW4KYmUgYXBwbGllZCBpbmRlcGVuZGVudGx5LgoKSSBoYXZlIHJlYmFz
ZWQgYW5kIHF1ZXVlZCBpdCBhcyBhIGZpeCBmb3IgTGludXgtNi4xNS4KClJlZ2FyZHMsCkFudXAK
Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMgYi9h
cmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiBpbmRleCA0NTc4ODYzYTM5ZTMuLmFjMGZhNTBiYzQ4OSAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2
bS92Y3B1LmMKPiBAQCAtNjUsNiArNjUsNyBAQCBzdGF0aWMgdm9pZCBrdm1fcmlzY3ZfdmNwdV9j
b250ZXh0X3Jlc2V0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPgo+ICAgICAgICAgbWVtc2V0KGNu
dHgsIDAsIHNpemVvZigqY250eCkpOwo+ICAgICAgICAgbWVtc2V0KGNzciwgMCwgc2l6ZW9mKCpj
c3IpKTsKPiArICAgICAgIG1lbXNldCgmdmNwdS0+YXJjaC5zbXN0YXRlZW5fY3NyLCAwLCBzaXpl
b2YodmNwdS0+YXJjaC5zbXN0YXRlZW5fY3NyKSk7Cj4KPiAgICAgICAgIC8qIFJlc3RvcmUgZGF0
YXAgYXMgaXQncyBub3QgYSBwYXJ0IG9mIHRoZSBndWVzdCBjb250ZXh0LiAqLwo+ICAgICAgICAg
Y250eC0+dmVjdG9yLmRhdGFwID0gdmVjdG9yX2RhdGFwOwo+IC0tCj4gMi40OC4xCj4KCi0tIApr
dm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
