Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33134CCFA03
	for <kvm-riscv@archiver.kernel.org>; Thu,  6 Nov 2025 06:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L1DJwmwpaF6Uss8/6WtDDu+0L4MBZkjZR5Gvu45Sldo=; b=mfrD6h0ipj7V2f
	W8wFIENNT45m8nswQheHsEYpbkHdfI9m1nYBQWOF1ENY0RU/4s3lDhlEmFv+ICUOh0clwKRbTM6IO
	6N9AfpzpPbq4hEEgJTEix+c2c13Nn8LTU3xAqliRRMpt824rN4AzEqKrwunibOpz846RiyLQDOLyJ
	e/N2qtLG8imM1mAzFjX7xZc8vVwSUOGj27wjnddDTMcGnDpKBUv4gMaMFbzyMSfMN0RInUwpK4cdi
	uyCMQko5NKycSWw1dyu2IIe7SGVmJFurZ0Gb9hncKXxXCjUqTelQ31jc1x6fz10vg5146gEnH9iyA
	67Szwm7RkpcCbJ+DU3CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGtKL-0000000Ew9Z-3WFy;
	Thu, 06 Nov 2025 06:18:33 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGtKI-0000000Ew8r-3FTc
	for kvm-riscv@lists.infradead.org;
	Thu, 06 Nov 2025 06:18:31 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-94849c6e0bbso20670339f.1
        for <kvm-riscv@lists.infradead.org>; Wed, 05 Nov 2025 22:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1762409910; x=1763014710; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDlEAMtwezpxLrpFe3CnV9gmK4kKgusAvfJ9H5INCMk=;
        b=pF8YoKXUjHWuZtSNsRLhL6IidbtVJkb5vJq8U5Fc0Me5ZmtLjySwBkKGGwZqJkGbp+
         AFdtpItUtamhKB5XJ0ToTUJEcDmQGsTFyga4ewCngC/kBs6eVGdi9KVGdeVjd/rKJJqJ
         eOQ0sDheO3zXN+qGthV/nDLdRuNpsLNwMK1jzQdR+TAb3mjM26nrz97/pdKYh6RCpLo4
         rKQpXEm+OnkKCXOhD5Lw74gX0PpfENRZdMAoVSUQ+ffOxgHgWdiQNlYohoYxhxYxOy9W
         Ym3pVvR1XOOahD/BdDtyVUKhyhVgJYi099ppvYsYJLmNxLSTNke+satXVZxDKHHlaqZI
         dUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762409910; x=1763014710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZDlEAMtwezpxLrpFe3CnV9gmK4kKgusAvfJ9H5INCMk=;
        b=c3Wu8G/Bbj92zgzDmcN2hCJtA+lg+tDqrsZmJ3rLxUabKgDCZx+7Gdbooj6Bza243b
         S/nnERLFeaGto/U5pP9UX0P5dNLEWcWkCN3YoAVJSCSKTzoHUJVUGvBeAVrySiVhInFu
         /hb4lP8Iai/pyl5xU07ws7UB44g+pNKgPC35OMXpCtrvx/pPMZOqG5P/dM4vOgjYbC2Q
         wLFookN+u/gSu1UaMfpKSjUl5dPJrhNSiDfdNHV9o+Kgwhvjg8Q2ECSGKQAZbTsHikgc
         yS+w0vECqFl1bqDvt18zPurACV74uKACxspcUO4eXrUsdO9/dWv1bruZ18avjdhc37ha
         Y+KA==
X-Forwarded-Encrypted: i=1; AJvYcCV6fo4kBU1vfJi3Qxf0Z6+aLV9bfSpV6sMQ7oYp2HEbFX3fSldLIE/WIRaXdETdjUPS4dSfciiC56c=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq9N5vb8ao84t1Y2V8PSXfKj64IYelUKDELSbY/qIsfCVm22ZU
	X97jsPQgdFK78unO8oMADtyIxOMSKOYIW2sbsH8bAxVghH4ZYyiAZf1PjwSu0Oam2c5N6zu+09o
	zRhYeK6JSxTJpu06ezM4eOAaRL5YOJObDQgIhOCaXfVuy1DQrISX0p6I=
X-Gm-Gg: ASbGncuZp8g+YCZ4vawTw6SQ3hs+idW0qJaku+tqEKiWgUOXHPsGQ4jlfB6U26aenBj
	IHQQmEg9+3ClxE6MBZvlxPtf2lgQPGkGii9kZyPzLXEpdr2Wx+Gg5bLrkJGXKmtEgSEsJBUcLba
	HCe8h4XcyE5MZdU2VrhMekYXDA3X7XAVrcJWiDPCXnCJ3o/C9ZHMW7T6ALQ40wC/5DW54GepUNj
	Op0l/i7WhHJI8T6L6g0XOp7IDHqMu0i56Lj8NoQsxBPmhDpzeOXknVTubQn2ipWWzLqncif
X-Google-Smtp-Source: AGHT+IE+rRbZRK5f4ZtDH8DjGPSvoL5SP2kkRip7iD92MCZ4BarBIUpiiJumXPAmNS0ZCoGwkMuOapcuWSF2WD95Ouk=
X-Received: by 2002:a92:ca0f:0:b0:433:27b5:1faa with SMTP id
 e9e14a558f8ab-43340759a02mr82201175ab.1.1762409909706; Wed, 05 Nov 2025
 22:18:29 -0800 (PST)
MIME-Version: 1.0
References: <20250912134332.22053-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20250912134332.22053-1-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 6 Nov 2025 11:48:17 +0530
X-Gm-Features: AWmQ_blNuHZQBO2zDIsL_jsP12Ozv0UDhbowq70IYcJdfGZ1HSMpnvQsCEW7hdU
Message-ID: <CAAhSdy0azfC-L3buko7-mN1PDWxi08HN=3NQ+0VeyMR8gVJNoQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix guest page fault within HLV* instructions
To: fangyu.yu@linux.alibaba.com
Cc: atish.patra@linux.dev, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, pbonzini@redhat.com, graf@amazon.com, 
	jiangyifei@huawei.com, guoren@kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_221830_846218_FF0C29D5 
X-CRM114-Status: GOOD (  17.90  )
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

T24gRnJpLCBTZXAgMTIsIDIwMjUgYXQgNzoxM+KAr1BNIDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+Cj4KPiBXaGVuIGV4ZWN1dGluZyBITFYqIGluc3RydWN0aW9ucyBhdCB0aGUgSFMgbW9k
ZSwgYSBndWVzdCBwYWdlIGZhdWx0Cj4gbWF5IG9jY3VyIHdoZW4gYSBnLXN0YWdlIHBhZ2UgdGFi
bGUgbWlncmF0aW9uIGJldHdlZW4gdHJpZ2dlcmluZyB0aGUKPiB2aXJ0dWFsIGluc3RydWN0aW9u
IGV4Y2VwdGlvbiBhbmQgZXhlY3V0aW5nIHRoZSBITFYqIGluc3RydWN0aW9uLgo+Cj4gVGhpcyBt
YXkgYmUgYSBjb3JuZXIgY2FzZSwgYW5kIG9uZSBzaW1wbGVyIHdheSB0byBoYW5kbGUgdGhpcyBp
cyB0bwo+IHJlLWV4ZWN1dGUgdGhlIGluc3RydWN0aW9uIHdoZXJlIHRoZSB2aXJ0dWFsICBpbnN0
cnVjdGlvbiBleGNlcHRpb24KPiBvY2N1cnJlZCwgYW5kIHRoZSBndWVzdCBwYWdlIGZhdWx0IHdp
bGwgYmUgYXV0b21hdGljYWxseSBoYW5kbGVkLgo+Cj4gRml4ZXM6IDlmNzAxMzI2NTExMiAoIlJJ
U0MtVjogS1ZNOiBIYW5kbGUgTU1JTyBleGl0cyBmb3IgVkNQVSIpCj4gU2lnbmVkLW9mZi1ieTog
RmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFiYS5jb20+Cj4gLS0tCj4gIGFyY2gvcmlz
Y3Yva3ZtL3ZjcHVfaW5zbi5jIHwgMjEgKysrKysrKysrKysrKysrKysrLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva3ZtL3ZjcHVfaW5zbi5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9pbnNuLmMK
PiBpbmRleCA5N2RlYzE4ZTY5ODkuLmE4YjkzYWE0ZDhlYyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L2t2bS92Y3B1X2luc24uYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfaW5zbi5jCj4g
QEAgLTQ0OCw3ICs0NDgsMTIgQEAgaW50IGt2bV9yaXNjdl92Y3B1X3ZpcnR1YWxfaW5zbihzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVuICpydW4sCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgaW5zbiA9IGt2bV9yaXNjdl92Y3B1X3VucHJpdl9yZWFkKHZjcHUsIHRydWUsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGN0LT5zZXBjLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAmdXRyYXApOwo+IC0gICAgICAgICAgICAgICAgICAgICAgIGlmICh1dHJh
cC5zY2F1c2UpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBzd2l0Y2ggKHV0cmFwLnNjYXVz
ZSkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIGNhc2UgMDoKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGJyZWFrOwoKVGhpcyBsb29rcyBsaWtlIGFuIHVucmVsYXRlZCBjaGFu
Z2Ugc28gZHJvcCBpdCBvciBzZW5kIGEgc2VwYXJhdGUgcGF0Y2gKd2l0aCBwcm9wZXIgZXhwbGFu
YXRpb24uCgo+ICsgICAgICAgICAgICAgICAgICAgICAgIGNhc2UgRVhDX0xPQURfR1VFU1RfUEFH
RV9GQVVMVDoKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBLVk1fSU5T
Tl9DT05USU5VRV9TQU1FX1NFUEM7CgpUaGUgS1ZNX0lOU05feHl6IGVudW0gdmFsdWVzIGFyZSBv
bmx5IGZvciBmdW5jdGlvbnMgY2FsbGVkIHZpYQpzeXN0ZW1fb3Bjb2RlX2luc24oKSBzbyByZXR1
cm4gMSBvdmVyIGhlcmUganVzdCBsaWtlIHRoZSBiZWxvdwpkZWZhdWx0IGNhc2UuCgpBbHNvLCBh
ZGQgc29tZSBjb21tZW50cyBvdmVyIGhlcmUgYWJvdXQgd2h5IHdlIGFyZSBzaW1wbHkKY29udGlu
dWluZyB0aGUgZ3Vlc3QuCgo+ICsgICAgICAgICAgICAgICAgICAgICAgIGRlZmF1bHQ6Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1dHJhcC5zZXBjID0gY3QtPnNlcGM7Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrdm1fcmlzY3ZfdmNwdV90cmFwX3JlZGlyZWN0
KHZjcHUsICZ1dHJhcCk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
MTsKPiBAQCAtNTAzLDcgKzUwOCwxMiBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfbW1pb19sb2FkKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9ydW4gKnJ1biwKPiAgICAgICAgICAgICAg
ICAgICovCj4gICAgICAgICAgICAgICAgIGluc24gPSBrdm1fcmlzY3ZfdmNwdV91bnByaXZfcmVh
ZCh2Y3B1LCB0cnVlLCBjdC0+c2VwYywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICZ1dHJhcCk7Cj4gLSAgICAgICAgICAgICAgIGlmICh1dHJhcC5z
Y2F1c2UpIHsKPiArICAgICAgICAgICAgICAgc3dpdGNoICh1dHJhcC5zY2F1c2UpIHsKPiArICAg
ICAgICAgICAgICAgY2FzZSAwOgo+ICsgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwoKVGhp
cyBsb29rcyBsaWtlIGFuIHVucmVsYXRlZCBjaGFuZ2Ugc28gZHJvcCBpdCBvciBzZW5kIGEgc2Vw
YXJhdGUgcGF0Y2gKd2l0aCBwcm9wZXIgZXhwbGFuYXRpb24uCgo+ICsgICAgICAgICAgICAgICBj
YXNlIEVYQ19MT0FEX0dVRVNUX1BBR0VfRkFVTFQ6Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIEtWTV9JTlNOX0NPTlRJTlVFX1NBTUVfU0VQQzsKClNhbWUgY29tbWVudCBhcyBrdm1f
cmlzY3ZfdmNwdV92aXJ0dWFsX2luc24oKS4KCj4gKyAgICAgICAgICAgICAgIGRlZmF1bHQ6Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgLyogUmVkaXJlY3QgdHJhcCBpZiB3ZSBmYWlsZWQgdG8g
cmVhZCBpbnN0cnVjdGlvbiAqLwo+ICAgICAgICAgICAgICAgICAgICAgICAgIHV0cmFwLnNlcGMg
PSBjdC0+c2VwYzsKPiAgICAgICAgICAgICAgICAgICAgICAgICBrdm1fcmlzY3ZfdmNwdV90cmFw
X3JlZGlyZWN0KHZjcHUsICZ1dHJhcCk7Cj4gQEAgLTYyOSw3ICs2MzksMTIgQEAgaW50IGt2bV9y
aXNjdl92Y3B1X21taW9fc3RvcmUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1
biAqcnVuLAo+ICAgICAgICAgICAgICAgICAgKi8KPiAgICAgICAgICAgICAgICAgaW5zbiA9IGt2
bV9yaXNjdl92Y3B1X3VucHJpdl9yZWFkKHZjcHUsIHRydWUsIGN0LT5zZXBjLAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnV0cmFwKTsKPiAtICAg
ICAgICAgICAgICAgaWYgKHV0cmFwLnNjYXVzZSkgewo+ICsgICAgICAgICAgICAgICBzd2l0Y2gg
KHV0cmFwLnNjYXVzZSkgewo+ICsgICAgICAgICAgICAgICBjYXNlIDA6Cj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgYnJlYWs7CgpUaGlzIGxvb2tzIGxpa2UgYW4gdW5yZWxhdGVkIGNoYW5nZSBz
byBkcm9wIGl0IG9yIHNlbmQgYSBzZXBhcmF0ZSBwYXRjaAp3aXRoIHByb3BlciBleHBsYW5hdGlv
bi4KCj4gKyAgICAgICAgICAgICAgIGNhc2UgRVhDX0xPQURfR1VFU1RfUEFHRV9GQVVMVDoKPiAr
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gS1ZNX0lOU05fQ09OVElOVUVfU0FNRV9TRVBD
OwoKU2FtZSBjb21tZW50IGFzIGt2bV9yaXNjdl92Y3B1X3ZpcnR1YWxfaW5zbigpLgoKPiArICAg
ICAgICAgICAgICAgZGVmYXVsdDoKPiAgICAgICAgICAgICAgICAgICAgICAgICAvKiBSZWRpcmVj
dCB0cmFwIGlmIHdlIGZhaWxlZCB0byByZWFkIGluc3RydWN0aW9uICovCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgdXRyYXAuc2VwYyA9IGN0LT5zZXBjOwo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGt2bV9yaXNjdl92Y3B1X3RyYXBfcmVkaXJlY3QodmNwdSwgJnV0cmFwKTsKPiAtLQo+IDIu
NDkuMAo+Cj4KClJlZ2FyZHMsCkFudXAKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
