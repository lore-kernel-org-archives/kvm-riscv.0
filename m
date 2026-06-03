Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE33ECD6E64
	for <kvm-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 08:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dLp3fi5zA2ofZ9JxrBw5cMjJN1YWCMKdqy6J5XRPMok=; b=Gyc+R75YuV0oiS
	/4ocWhK2AowhFR2KV9Vhjdm3s4BE5vgvU6gqVZtqf0QCk53Homo96jSuNhG+SChWZrl12GQSlLjQ+
	k5sZpfduM2uBiWtnfDHcL7rVh9Z0mU+L00SgQm6HvhAc7zkdLxwe1WNEyMxdUZJ6Xelr8c8FP5Kyy
	y2hU67Rl4WGzvayyqZh++VcZ2A0vG9BNL088ZiBPNWuNWZUXx/FHrWAqn3fBDEVR0iCgvlIx3QW/e
	W063pnWo206wpIS6GelkwRchFB7XnIqHxvnaFBEt+FAiSC056RWIp51YvaPQARwOJXZD1GoEQ7F/v
	ZPt+2bBWxavmGtHSd5WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgoX-0000000EYqa-2Mgi;
	Wed, 03 Jun 2026 08:19:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgoV-0000000EYox-2SQl
	for kvm-riscv@bombadil.infradead.org;
	Wed, 03 Jun 2026 08:18:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kFeTv/Mtw5rUnQHNWc9zOtQG7POGqdE/BRFIOTGTTdw=; b=HBZebZk7aWCMXxl+hcpbpmnWa2
	7qs1tULLHQocyLNzET1wBscULihAxtFPheW4T4ptLuzyUceQ3bypBoLBc4E8wubfH+a/Oh4zj6jZ1
	0+2HsOaqTNHx6QtcIqKXx24xqnaQK/AueGJgT2w6a8MuUTCktM17jZcjfI0528fF5HEVN97fTpXCA
	fjn/yW8fZzz0vTErBSzdb/lvb3uGwn06VWBTdby1TKQeH5oUZgyz5i3DYrsa4NLJorzMlqe20czKY
	cWMYC2nLjcHso+GcTAMbYLVQRHk7oqKocBBa5FeO2dwLnI+E7ATHYKLQYRMHOqqAFFab0pwW53VPy
	UpJhZ9Vw==;
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUgoQ-0000000BYV9-2QSq
	for kvm-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 08:18:57 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7e6b571750bso2690341a34.1
        for <kvm-riscv@lists.infradead.org>; Wed, 03 Jun 2026 01:18:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780474733; cv=none;
        d=google.com; s=arc-20240605;
        b=EFR1ZtW+97NIiYw+JcA1ni54h+TlipHfUtvcy8ssocql6fKTeCq+V6PRsj9o1EPRO0
         Jb86+S0Q4P8/GakYbm2t0SBaxqYE8KCsvU8SEGFBtV/biWOUYo03opzioKdyEov8XfLS
         uY8JPHhlPNQal7iD7th57c2RE3KXEuPYxsS41prJryzbXkOLhNK4EfGBdGGTG64Ay59G
         LMK/jcSS56wlz1ptkpysxixKbNouIZjWDf5BpaWLANKH4HhDFz/U+0hwUjimjVttAp2v
         Ip6p6fRR4Be74OoGAxMkk20wxfxuR5VyPt7TBhLeX12Tpg3Afv0irEerLOv6sp58rPkE
         oujQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kFeTv/Mtw5rUnQHNWc9zOtQG7POGqdE/BRFIOTGTTdw=;
        fh=0e0UbUcipzZN+vM7xBXdDJYH2S57/1Xy7LrRM16g23g=;
        b=j8xSfCj1RGd47ReWtlktqNzCALzEitEA8xOWwXY/dBQH+XHJDHCW2jjFF/AMs0Sgnx
         EoIVd/LMP7e1IGx6Tx4Ei+1W5ofYBbeuKs9hoLn5n5jz00o0k0zxYiaS+uhwfoJD6XpQ
         fPCSK4XZRedMhcnpYua4+wWhxeN1aAK5namVLnIJfPatm8zBTVE1r65eQW8ZyPf77wgv
         uSqsxsB+F/qxabs8uWJDVXpXt6bVVcmu8/5keLjgExn+1U8bzls92oJriXFQAR+0UDWT
         woCEISyMq6/rWR+lCdM0aGDXV1kjtvboDpKM/Ad39EJeMSsgsbXHJ0Vh56CF8MuiyuSd
         iuPw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780474733; x=1781079533; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFeTv/Mtw5rUnQHNWc9zOtQG7POGqdE/BRFIOTGTTdw=;
        b=sHr8NUSUf69wk59bpSCh1qRcYTNiaSr4llFocCSa3g/dGU9sZG7XCLBWr+l9Fdx574
         QqHFNpGYpKbf3OMJV7XMgxJ4TGZ4HGKC7o4YgfTLPwV8k1+WDo98fxPz9CeAueaw5X+I
         pp4AtU8OK+/l3jq/SOXqtjUqpqcGCAl2zwOdCj8k0oSX18RhmfQ/L+iCdvEn2OZYEhjL
         xh8OI8Xxj1fUjXTUF7NrmVwRaCvbwBLgGs/uo37MuS+aULLkMdSUskHFCDRtJx9Y79OT
         h4wfEBXeIkRvlfNgeGMCCYYRtJrC/xuc1Xn69FEEawTbOUwangjLDtjQAyfIVic2KZEo
         1NlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780474733; x=1781079533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kFeTv/Mtw5rUnQHNWc9zOtQG7POGqdE/BRFIOTGTTdw=;
        b=IYsZmOS+NKN/2mXQx8AEIaA8pGXKAcEDNr2dTgPGciz0DYH/i/VrsYhQz5eRqoWydY
         ObBEhUg3wzfp1RBXBrj7pPhp4cWqH0uNGscI61jGmb/w3at2f21buKIfa+WWwQV3lF+q
         IUF8ZbgMoEBg4FDOP1EszyqmMonwIAkJjauii+SwOUiqI71cZqonmK3ITK6HP5pc6jF7
         lPEqrs1XDKlOneNTzJXHsnf8g0u7GNUzkDwCbcN2eiWF2ub76ecJ/lXl2Iz4k7ZA6fpL
         I9bPVe+7+DvCI1xiz0d7gjDLcsqC+isUJoO5QjclwILKSsVhyK7AbtN5m0B3zaTrSWTF
         Dg1A==
X-Forwarded-Encrypted: i=1; AFNElJ8Z/WAGUGQ6swQQqTPkSdweaVqdUMgSWUBMALWXJBGiZKttK/GMZiwS8zlbr31k/KJx4DQsxuB6ZXY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyJyCNVvRz/WAPDWT4qZS7nZqJHJ5tf+7MOzXvWGuX+eefQsKYl
	fTp7gdVbuOM+lniVy/s/AoNpX6J0JNSbTu/IzfkS7y8JkReWIDU4fny68UZqRe1Cvnau238hjMi
	tDA9ZDEwsJBjk4CfV2A6f/9zH8P7rFDmSFtFnGwERBQ==
X-Gm-Gg: Acq92OGP1nPIe8glYLh3H9O2ax1zilFQ2c88/2Wm23M67mV/abb7M+8ILIoTLrhAqZT
	MQwlmA+nPG94UE6utfgSbMn+GQpwbUifkDHL8ptyQJrpyt/9xN9DVTa3JGfoutjRMfRP55vrkHg
	Xc7ciX5kbnr/PXKxO1MuxcWaq4ZpZKAvUYMmHyRoGD6YrBXk8CmMud6lcH6NzAq8f71XTqm6zeL
	/pBh0z3z6MzHXlD6A5k4xUJAfUfbt6cOnyH20l/o4NG48tfuk9yALTkC3kqnFfo3mu5GDZEyams
	oSu0u1KkpsZlK5krpcOYoZMbDA8lkSFgZ/pBkqgd0bY1URqAABJpjwqrbK2Qa8c3t0iGtMk4Obr
	oms8oVzlVsuX8WVhGoFwxntuJGoqoagQXWg9uWw==
X-Received: by 2002:a4a:e053:0:b0:696:84a7:1c9e with SMTP id
 006d021491bc7-69e480ca3afmr1083284eaf.54.1780474732678; Wed, 03 Jun 2026
 01:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260513153656847l3c4fI5hBsAyoIZi8aGIs@zte.com.cn> <20260513154125023xfKNqfea7TklqO9_RRrkt@zte.com.cn>
In-Reply-To: <20260513154125023xfKNqfea7TklqO9_RRrkt@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 3 Jun 2026 13:48:41 +0530
X-Gm-Features: AVHnY4KFDoPAklYlm9v6C3lajzcXBdS812tUFjYiyrvVraXpwSqHdXHXDDLKwNc
Message-ID: <CAAhSdy28AR=Gs90nofSWPkh9z_gmwmmTjsae_PCyyL_5qXcGhQ@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_2=2F4=5D_RISC=2DV=3A_KVM=3A_Split_huge_pages_when_d?=
	=?UTF-8?Q?irty_logging_is=C2=A0enabled?=
To: wang.yechao255@zte.com.cn
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_091854_841783_37C697A7 
X-CRM114-Status: GOOD (  19.11  )
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

T24gV2VkLCBNYXkgMTMsIDIwMjYgYXQgMToxMeKAr1BNIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPiB3cm90ZToKPgo+IEZyb206IFdhbmcgWWVjaGFvIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPgo+Cj4gU3BsaXQgaHVnZSBwYWdlcyBlYWdlcmx5IHdoZW4gZW5hYmxpbmcgZGlydHkgbG9n
Z2luZy4gVGhlIGdvYWwgaXMgdG8KPiBhdm9pZCBkb2luZyBpdCB3aGlsZSBmYXVsdGluZyBvbiB3
cml0ZS1wcm90ZWN0ZWQgcGFnZXMsIHdoaWNoCj4gbmVnYXRpdmVseSBpbXBhY3RzIGd1ZXN0IHBl
cmZvcm1hbmNlLgo+Cj4gVGhlIGJlbmVmaXRzIG9mIGVhZ2VyIHBhZ2Ugc3BsaXR0aW5nIGFyZSB0
aGUgc2FtZSBhcyBpbiB4ODYgYW5kIGFybTY0LAo+IGFkZGVkIHdpdGggY29tbWl0IGEzZmU1ZGJk
YTBhNCAoIktWTTogeDg2L21tdTogU3BsaXQgaHVnZSBwYWdlcyBtYXBwZWQKPiBieSB0aGUgVERQ
IE1NVSB3aGVuIGRpcnR5IGxvZ2dpbmcgaXMgZW5hYmxlZCIpIGFuZCBjb21taXQgZTdiZjdhNDkw
YzY4Cj4gKCJLVk06IGFybTY0OiBTcGxpdCBodWdlIHBhZ2VzIHdoZW4gZGlydHkgbG9nZ2luZyBp
cyBlbmFibGVkIikKPgo+IFNpZ25lZC1vZmYtYnk6IFdhbmcgWWVjaGFvIDx3YW5nLnllY2hhbzI1
NUB6dGUuY29tLmNuPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9tbXUuYyB8IDYyICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA2
MiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vbW11LmMgYi9h
cmNoL3Jpc2N2L2t2bS9tbXUuYwo+IGluZGV4IDg1YTNmYjI2MjJhNC4uMTRjNTU4ZWU1ZjE1IDEw
MDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0v
bW11LmMKPiBAQCAtOTAsNiArOTAsNTAgQEAgdm9pZCBrdm1fcmlzY3ZfbW11X2lvdW5tYXAoc3Ry
dWN0IGt2bSAqa3ZtLCBncGFfdCBncGEsIHVuc2lnbmVkIGxvbmcgc2l6ZSkKPiAgICAgICAgIHNw
aW5fdW5sb2NrKCZrdm0tPm1tdV9sb2NrKTsKPiAgfQo+Cj4gK3N0YXRpYyBib29sIG5lZWRfdG9w
dXBfc3BsaXRfY2FjaGVzX29yX3Jlc2NoZWQoc3RydWN0IGt2bV9tbXVfbWVtb3J5X2NhY2hlICpj
YWNoZSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlu
dCBjb3VudCkKPiArewo+ICsgICAgICAgaWYgKG5lZWRfcmVzY2hlZCgpKQo+ICsgICAgICAgICAg
ICAgICByZXR1cm4gdHJ1ZTsKPiArCj4gKyAgICAgICByZXR1cm4ga3ZtX21tdV9tZW1vcnlfY2Fj
aGVfbnJfZnJlZV9vYmplY3RzKGNhY2hlKSA8IGNvdW50Owo+ICt9Cj4gKwo+ICsvKiB0aGUgY2Fs
bGVyIG11c3QgaGVsZCBtbXUgbG9jayAqLwo+ICtzdGF0aWMgdm9pZCBrdm1fcmlzY3Zfc3BsaXRf
aHVnZV9wYWdlcyhzdHJ1Y3Qga3ZtX2dzdGFnZSAqZ3N0YWdlLAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBoeXNfYWRkcl90IHN0YXJ0LCBwaHlzX2FkZHJfdCBlbmQs
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBmbHVzaCkKCnMv
a3ZtX3Jpc2N2X3NwbGl0X2h1Z2VfcGFnZXMvbW11X3NwbGl0X2h1Z2VfcGFnZXMvCgo+ICt7Cj4g
KyAgICAgICBzdHJ1Y3Qga3ZtICprdm0gPSBnc3RhZ2UtPmt2bTsKPiArICAgICAgIHN0cnVjdCBr
dm1fbW11X21lbW9yeV9jYWNoZSAqcGNhY2hlID0gJmt2bS0+YXJjaC5zcGxpdF9wYWdlX2NhY2hl
Owo+ICsgICAgICAgaW50IGNvdW50ID0gZ3N0YWdlLT5wZ2RfbGV2ZWxzOwo+ICsgICAgICAgcGh5
c19hZGRyX3QgYWRkciA9IHN0YXJ0Owo+ICsgICAgICAgaW50IHJldDsKPiArCgpsb2NrZGVwX2Fz
c2VydF9oZWxkID8/Cgo+ICsgICAgICAgd2hpbGUgKGFkZHIgPCBlbmQpIHsKPiArICAgICAgICAg
ICAgICAgaWYgKG5lZWRfdG9wdXBfc3BsaXRfY2FjaGVzX29yX3Jlc2NoZWQocGNhY2hlLCBjb3Vu
dCkpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBzcGluX3VubG9jaygma3ZtLT5tbXVfbG9j
ayk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29uZF9yZXNjaGVkKCk7Cj4gKwo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIHJldCA9IGt2bV9tbXVfdG9wdXBfbWVtb3J5X2NhY2hlKHBjYWNo
ZSwgY291bnQpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChyZXQpIHsKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGt2bV9lcnIoIkZhaWxlZCB0byB0b3VwIHNwbGl0IHBh
Z2UgY2FjaGVcbiIpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3Bpbl9sb2Nr
KCZrdm0tPm1tdV9sb2NrKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVy
bjsKPiArICAgICAgICAgICAgICAgICAgICAgICB9Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
c3Bpbl9sb2NrKCZrdm0tPm1tdV9sb2NrKTsKPiArICAgICAgICAgICAgICAgfQo+ICsKPiArICAg
ICAgICAgICAgICAgcmV0ID0ga3ZtX3Jpc2N2X2dzdGFnZV9zcGxpdF9odWdlKGdzdGFnZSwgcGNh
Y2hlLCBhZGRyLCAwLCBmbHVzaCk7Cj4gKyAgICAgICAgICAgICAgIGlmIChyZXQgIT0gMCkgewo+
ICsgICAgICAgICAgICAgICAgICAgICAgIGt2bV9lcnIoInNwbGl0IGh1Z2UgcGFnZSBmb3IgYWRk
cigweCVsbHgpIGZhaWxlZCAlZFxuIiwgYWRkciwgcmV0KTsKPiArICAgICAgICAgICAgICAgICAg
ICAgICBicmVhazsKPiArICAgICAgICAgICAgICAgfQo+ICsKPiArICAgICAgICAgICAgICAgYWRk
ciArPSBQTURfU0laRTsKPiArICAgICAgIH0KPiArfQo+ICsKPiAgdm9pZCBrdm1fYXJjaF9tbXVf
ZW5hYmxlX2xvZ19kaXJ0eV9wdF9tYXNrZWQoc3RydWN0IGt2bSAqa3ZtLAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3Qg
KnNsb3QsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2Zu
X3QgZ2ZuX29mZnNldCwKPiBAQCAtMTM2LDYgKzE4MCwyMyBAQCB2b2lkIGt2bV9hcmNoX2ZsdXNo
X3NoYWRvd19tZW1zbG90KHN0cnVjdCBrdm0gKmt2bSwKPiAgICAgICAgIHNwaW5fdW5sb2NrKCZr
dm0tPm1tdV9sb2NrKTsKPiAgfQo+Cj4gK3N0YXRpYyB2b2lkIGt2bV9yaXNjdl9zcGxpdF9tZW1v
cnlfcmVnaW9uKHN0cnVjdCBrdm0gKmt2bSwgaW50IHNsb3QpCgpzL2t2bV9yaXNjdl9zcGxpdF9t
ZW1vcnlfcmVnaW9uL21tdV9zcGxpdF9tZW1vcnlfcmVnaW9uLwoKPiArewo+ICsgICAgICAgc3Ry
dWN0IGt2bV9tZW1zbG90cyAqc2xvdHMgPSBrdm1fbWVtc2xvdHMoa3ZtKTsKPiArICAgICAgIHN0
cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKm1lbXNsb3QgPSBpZF90b19tZW1zbG90KHNsb3RzLCBzbG90
KTsKPiArICAgICAgIHBoeXNfYWRkcl90IHN0YXJ0ID0gbWVtc2xvdC0+YmFzZV9nZm4gPDwgUEFH
RV9TSElGVDsKPiArICAgICAgIHBoeXNfYWRkcl90IGVuZCA9IChtZW1zbG90LT5iYXNlX2dmbiAr
IG1lbXNsb3QtPm5wYWdlcykgPDwgUEFHRV9TSElGVDsKPiArICAgICAgIHN0cnVjdCBrdm1fZ3N0
YWdlIGdzdGFnZTsKPiArCj4gKyAgICAgICBrdm1fcmlzY3ZfZ3N0YWdlX2luaXQoJmdzdGFnZSwg
a3ZtKTsKPiArCj4gKyAgICAgICBzcGluX2xvY2soJmt2bS0+bW11X2xvY2spOwo+ICsgICAgICAg
a3ZtX3Jpc2N2X3NwbGl0X2h1Z2VfcGFnZXMoJmdzdGFnZSwgc3RhcnQsIGVuZCwgZmFsc2UpOwo+
ICsgICAgICAgc3Bpbl91bmxvY2soJmt2bS0+bW11X2xvY2spOwo+ICsKPiArICAgICAgIGt2bV9m
bHVzaF9yZW1vdGVfdGxic19tZW1zbG90KGt2bSwgbWVtc2xvdCk7Cj4gK30KPiArCj4gIHZvaWQg
a3ZtX2FyY2hfY29tbWl0X21lbW9yeV9yZWdpb24oc3RydWN0IGt2bSAqa3ZtLAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqb2xkLAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGt2bV9tZW1vcnlfc2xv
dCAqbmV3LAo+IEBAIC0xNTAsNiArMjExLDcgQEAgdm9pZCBrdm1fYXJjaF9jb21taXRfbWVtb3J5
X3JlZ2lvbihzdHJ1Y3Qga3ZtICprdm0sCj4gICAgICAgICAgICAgICAgIGlmIChrdm1fZGlydHlf
bG9nX21hbnVhbF9wcm90ZWN0X2FuZF9pbml0X3NldChrdm0pKQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIHJldHVybjsKPiAgICAgICAgICAgICAgICAgbW11X3dwX21lbW9yeV9yZWdpb24oa3Zt
LCBuZXctPmlkKTsKPiArICAgICAgICAgICAgICAga3ZtX3Jpc2N2X3NwbGl0X21lbW9yeV9yZWdp
b24oa3ZtLCBuZXctPmlkKTsKPiAgICAgICAgIH0KPiAgfQo+Cj4gLS0KPiAyLjI3LjAKClJlZ2Fy
ZHMsCkFudXAKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3Zt
LXJpc2N2Cg==
