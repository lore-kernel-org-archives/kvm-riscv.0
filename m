Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E89FCA1014
	for <kvm-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 03:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TcJC6ZkVjumO+gG2dF/WmKB+/cPb+b77Qc7VNGBsiCU=; b=s536Hc6u8K0qZc
	HrqokB0xXCvERS2nK6ltJ1JAYIEf05fFHKk4CLdQuuFj4DD1nJZvMzzst6ogHhiVGT5MoVUTujd2q
	/snZWEiXqJSHpf7l+7q+ZXRTJC5TnFQtIgm7IkGSCbnhnvQnjMWlosCExsk1DZu05fFTKJdpwMNBX
	B8v1Feh3o5ZEvfittpugNd8NgNhaz5yApkWWWAV2LpKZ83lcHQHenk+GpECBdoHtHBHqeYAZ1bbD/
	N4w5ExnLep0WMITLN9UI0Wollw6Z87Gv/QHrHKbGvXK9Qemd5y1+7RrciOJo0UVjfIFFg6So3S4yp
	Ny8R77wD4wcGPsRYq7Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0Ld-00000008aMs-0Uz7;
	Thu, 04 Sep 2025 03:09:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0La-00000008aLb-3Bk3;
	Thu, 04 Sep 2025 03:09:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AF53644B72;
	Thu,  4 Sep 2025 03:09:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED34C4CEF1;
	Thu,  4 Sep 2025 03:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756955352;
	bh=2suWeNf3cFKy886NMzzbtvUL5qtLRZ5jEq1rGPIzRrU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=q5kHFqPUgDVJ35myaiu8/I6sO2I+p0++BOU7ly0ZRRcYpQWXCJ4wETXIv3v6K8j5k
	 7oWZn2TjFrG7sFG2GfR0ZccNlQnELaJlJgcjzdCkuRABO1YuQUR0EtT9jQjZHJBzjY
	 FUNo4vCpQC0qKEhAJkwGcbES6WC7EEKSlB4ejI6pG3hYeKoYMnVOHDlmmiF5rwHp52
	 PK9O30TOBAgeOggzQSTGN1KEPbI7gkpoBtXzD+vVv2gj3tB7EZYlIF8ZmcM7dfTAfp
	 QqUKguG9SCekFEG3cJtAzErKDdsH69xU2A+sR2UKxe7OKPZVaZSBJ14J+1Z8xhA5Ca
	 xTBrFrlzf6U9Q==
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3d44d734cabso292377f8f.3;
        Wed, 03 Sep 2025 20:09:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVVw4QtIVgzjKoHy7c3bnOMh3B1LG2QmokSTuhTE+uiHgqJhkqDdUJ9+GPP53l0TxSYCSBj3KIcbek=@lists.infradead.org, AJvYcCXqFh9b94gCnVimBXBBBtSifaw3S34oUGGvNB9ARNP/gQxpMYB2zV3KYQrPiPwq8YEH1j+GfXHs4q9Wmbk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwQyjXnGmNATpX4pi+BwIQXA1gOY4R/W+hmlUZfkoWXso106Vu1
	17o0GdeJYWd8X949uBtE/VmkVW4vtE1N36b5t5wis9oWetpV4ycYgIvhCC7n5f/cXNDerulAmoa
	wfjz3tkd0+wf4T6MMBFz5+scLcoPxsVo=
X-Google-Smtp-Source: AGHT+IFR6aINYU7huKlE/OzhcrboCQPzjWOQtTxIkuqU3b3el3/Iaex4o/xeyeJwxdLpMr/sGoJWeT6JGXEg536d6+c=
X-Received: by 2002:a5d:5f95:0:b0:3bd:6308:a4bb with SMTP id
 ffacd0b85a97d-3d1e0c85701mr13117757f8f.59.1756955351097; Wed, 03 Sep 2025
 20:09:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250821142542.2472079-1-guoren@kernel.org>
In-Reply-To: <20250821142542.2472079-1-guoren@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 4 Sep 2025 11:08:58 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ3XJB_UtziyfV0aFdg=L=mqc7KJPv4a8=3Z5pQYNDLng@mail.gmail.com>
X-Gm-Features: Ac12FXwfohQEMlAkgm0ZGL0DFWWPk2cp_RxqrogprJgi0tUpgxNcRoqaF99tnT0
Message-ID: <CAJF2gTQ3XJB_UtziyfV0aFdg=L=mqc7KJPv4a8=3Z5pQYNDLng@mail.gmail.com>
Subject: Re: [PATCH V4 RESEND 0/3] Fixup & optimize hgatp mode & vmid detect functions
To: anup@brainfault.org
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, atish.patra@linux.dev, 
	guoren@kernel.org, troy.mitchell@linux.dev, fangyu.yu@linux.alibaba.com, 
	guoren@linux.alibaba.com, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_200914_824551_FE6C9AA3 
X-CRM114-Status: GOOD (  11.85  )
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

SGkgQW51cCwKClBpbmcuLi4sIGhvcGUgZm9yIGZlZWRiYWNrLgoKT24gVGh1LCBBdWcgMjEsIDIw
MjUgYXQgMTA6MjbigK9QTSA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gRnJvbTogIkd1
byBSZW4gKEFsaWJhYmEgREFNTyBBY2FkZW15KSIgPGd1b3JlbkBrZXJuZWwub3JnPgo+Cj4gSGVy
ZSBhcmUgc2VydmFsIGZpeHVwICYgb3B0bWl6aXRpb25zIGZvciBoZ2F0cCBkZXRlY3QgYWNjb3Jk
aW5nCj4gdG8gdGhlIFJJU0MtViBQcml2aWxlZ2VkIEFyY2hpdGVjdHVyZSBTcGVjLgo+Cj4gLS0t
Cj4gQ2hhbmdlcyBpbiB2NDoKPiAgLSBJbnZvbHZlICgiUklTQy1WOiBLVk06IFByZXZlbnQgSEdB
VFBfTU9ERV9CQVJFIHBhc3NlZCIpLCB3aGljaAo+ICAgIGV4cGxhaW4gd2h5IGdzdGFnZV9tb2Rl
X2RldGVjdCBuZWVkcyByZXNldCBIR0FUUCB0byB6ZXJvLgo+ICAtIFJFU0VORCBmb3Igd3Jvbmcg
bWFpbGluZyB0aHJlYWQuCj4KPiBDaGFuZ2VzIGluIHYzOgo+ICAtIEFkZCAiRml4ZXMiIHRhZy4K
PiAgLSBJbnZvbHZlKCJSSVNDLVY6IEtWTTogUmVtb3ZlIHVubmVjZXNzYXJ5IEhHQVRQIGNzcl9y
ZWFkIiksIHdoaWNoCj4gICAgZGVwZW5kcyBvbiBwYXRjaCAxLgo+Cj4gQ2hhbmdlcyBpbiB2MjoK
PiAgLSBGaXhlZCBidWlsZCBlcnJvciBzaW5jZSBrdm1fcmlzY3ZfZ3N0YWdlX21vZGUoKSBoYXMg
YmVlbiBtb2RpZmllZC4KPiAtLS0KPgo+IEZhbmd5dSBZdSAoMSk6Cj4gICBSSVNDLVY6IEtWTTog
V3JpdGUgaGdhdHAgcmVnaXN0ZXIgd2l0aCB2YWxpZCBtb2RlIGJpdHMKPgo+IEd1byBSZW4gKEFs
aWJhYmEgREFNTyBBY2FkZW15KSAoMik6Cj4gICBSSVNDLVY6IEtWTTogUmVtb3ZlIHVubmVjZXNz
YXJ5IEhHQVRQIGNzcl9yZWFkCj4gICBSSVNDLVY6IEtWTTogUHJldmVudCBIR0FUUF9NT0RFX0JB
UkUgcGFzc2VkCj4KPiAgYXJjaC9yaXNjdi9rdm0vZ3N0YWdlLmMgfCAyNyArKysrKysrKysrKysr
KysrKysrKysrKystLS0KPiAgYXJjaC9yaXNjdi9rdm0vbWFpbi5jICAgfCAzNSArKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92bWlkLmMgICB8ICA4
ICsrKy0tLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRp
b25zKC0pCj4KPiAtLQo+IDIuNDAuMQo+CgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKLS0g
Cmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
