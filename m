Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4D8C369D9
	for <kvm-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 20:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0eN4INo280UU08XzLQ36v6dJxuBDlyCsde6umTlNkeI=; b=XToYiKgWI8uwCZ
	yJS0NORMohFqVxLpooUfQXZXbDE9RJXZpgMl7PvAaauwTgR83s/FNzws1aoTdtlaLcdxDWF9X2vsL
	2a4rOSiNrpNJKy1pTOHHAMnbAYd2kzHTSSpm6iN4iJXGTsJ5lReOKGyzsHaDyQIEwf2FyLGtzDkQr
	Y+DQYUNr3aNHVXAhFpKL04pSrNLtufFG9nU2SfwA41b2i2oNgz+z1XLVzJj/8Q52cSlwddQIBmLxf
	oemQ9+t6qeyxrETHptbClgZYtCFsm6TQ1nldmHU3wa/kYLji9jhtdeuEnjU5lSdp1hvNoODD3SbCn
	9zKlCsNlxlOn9MlbwAyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAEDO-0000000Dwhy-05uT;
	Wed, 30 Apr 2025 20:39:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAE59-0000000DvMH-2WuQ
	for kvm-riscv@bombadil.infradead.org;
	Wed, 30 Apr 2025 20:31:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=477PHwtL5TNDtw9yERMTqK+bm+SW5j6JJbM2jEsH4cs=; b=vJ2tCZXI9P7yHCgbR27Ak9/+7k
	m1y5oQGEttxpwu72HJ1D2A7iskAr04fQYQyJEWtM+LbkpT0o5WF89v5ffXpcUk7x9xvr+keUdU/lG
	dz+W5h3COX7Uu/dEQILjHqwafr1mk48zIgQ3YNkA4f/luhlEgjxDhIB7076bmIVaYenGrRCO513Qp
	LV4YdtG4Ifb4Awewmko46FLYLU8iTjVhKkLKbimqaLQO4wC404gafdewOR1Rfb4zYNAcfnj5vtUvf
	kyXJTtNkI+CsUs5cSbau25sZutDUwF/FHS+wzw6cWdWVi75++2GH2Km8VHRHhCwH0bQ+MokZzmLyH
	6RwezUWA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAE55-0000000DrKC-1WhZ
	for kvm-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 20:31:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746045056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=477PHwtL5TNDtw9yERMTqK+bm+SW5j6JJbM2jEsH4cs=;
	b=SG/touyuWU8T26H/R6+Rjf3K8kQAvheDXhewyHARI9TePnN+ltaprjOhHOo66WCYDxXzI2
	zYdCFibtU6xQXVYEh/6n5kFRRi8UNJqYQQE95p/j7od0fE2lNzxIjPPXVtgwAYVCl7aYHD
	TQ+qUmajg6Sz6xXlNCJF/mU+pGIjKa4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746045056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=477PHwtL5TNDtw9yERMTqK+bm+SW5j6JJbM2jEsH4cs=;
	b=SG/touyuWU8T26H/R6+Rjf3K8kQAvheDXhewyHARI9TePnN+ltaprjOhHOo66WCYDxXzI2
	zYdCFibtU6xQXVYEh/6n5kFRRi8UNJqYQQE95p/j7od0fE2lNzxIjPPXVtgwAYVCl7aYHD
	TQ+qUmajg6Sz6xXlNCJF/mU+pGIjKa4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746045057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=477PHwtL5TNDtw9yERMTqK+bm+SW5j6JJbM2jEsH4cs=;
	b=ifWUo/aXxrRpgDc8iELJdN/0C8sqMFxb5/gwyp7AsFTSQnq9zxbCJgxWuA6NMC2MdukIlC
	FIpJMSthcsB1gwVuK1Uz+6I3Zhg1Rksa2Tdr2+28cp5KEupVCHsvp1RlluEfew+VOjkD+v
	pCmtnYCLmspzlPYfR4num4A0IJQe3vo=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-Gv_fb9i2NJGtz2uOIN9f4g-1; Wed, 30 Apr 2025 16:30:55 -0400
X-MC-Unique: Gv_fb9i2NJGtz2uOIN9f4g-1
X-Mimecast-MFC-AGG-ID: Gv_fb9i2NJGtz2uOIN9f4g_1746045055
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8f9057432so5653206d6.1
        for <kvm-riscv@lists.infradead.org>; Wed, 30 Apr 2025 13:30:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746045055; x=1746649855;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kLCLNjhH9N/SbhZgwe55OZ5mfyV+uMRJ+/FIl8sp4MU=;
        b=hm/fOpuo6SztTA+HtT9MhBaCdH4B/n4qtz1R+Et5dJC/oXV2R8Wa4cpddJMVF1YXz0
         pL26uwGplhHa7hTa5t1Hi7LhqarkvCFcmoE817oUd8439C5v+713HeBrAMLnQq2ue4Z/
         +Wig9hipMCtdTlESQx749Oq6R/Hnuwm5pQBecbDYNl4uhzFdjBFxwZMrxaWLdoKvkWgO
         tUo2aEHZh+R8D+yV5LB4AMg8qoWaQxIQWc4c/eLOJvLEGbrQclIqihaw+KyoEbLpT2sd
         mnxBXvPmaOcQrCph1JPMCKdJup2Vpc8j3Vw5AVd+8hSAUJCr8URq+EIxVpMv2Pvnamkh
         PpGA==
X-Forwarded-Encrypted: i=1; AJvYcCXCzRDh/IxXeRb9avGV/pf9p9tkWJp6pgGh+69be4SnHCRrRBdUVeMRB3cOzOfeaJxWbBki/2KT3yE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyZIznsThY7ULhhM/Bv7WjUIFvW+O3B0v+/XBaOeM236IjPN0y7
	LK/dWZvPw32u2IQZqnpUos80udldgKkJrj0OxKvNl5pup/RvXc3kEnC+VsiYDnUWVJpiPnwqDn/
	78I320xePI0g/2sZYuDTxtHOpyBiFwYYrN8OJgFmDb8kjmHMigmp3oiDXZxOzQuA=
X-Gm-Gg: ASbGncuAuApDjaAwt61QC0WMawfA176wOb4FCjjmVzJnvu8a/LWcu0u+P9nrcI/+Eml
	xxuiXWrFlNnkDjdfIwceZ6xEX0ns4ZwD0gKiQQ1Y1KI8ffpBCsrPP8YT/hcnmth6cmYEHCaJp7i
	1qreMHlipRDba43Vm2AbIz0AZn3CmBhuuJLRAnhqLZSkIMOx5hiV4xUqcqZDMbcxKPtXAojY+dq
	mF4JU7/6XxlmSHcJAADkcypqnWeJiRsx44qxyWZhg/xqboVe0PTUjjI1j8hkyTvCelzFSA7/q83
	6wHNTlaFxOANqA5fL1eyntBuezEJRVAcFc6y9A7SR3UJwT7/idfkubhqRLM=
X-Received: by 2002:a05:6214:2584:b0:6e8:fb92:dffa with SMTP id 6a1803df08f44-6f4fe081236mr60226496d6.25.1746045054738;
        Wed, 30 Apr 2025 13:30:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqMC1VAUYkFR8BRk72B9YM6tHcI7coSFQe+I2l2BvKOrJizso3ayI0TGKXXExNYQxM53jAuA==
X-Received: by 2002:a05:6214:2584:b0:6e8:fb92:dffa with SMTP id 6a1803df08f44-6f4fe081236mr60225826d6.25.1746045054231;
        Wed, 30 Apr 2025 13:30:54 -0700 (PDT)
Received: from ?IPv6:2607:fea8:fc01:8d8d:5c3d:ce6:f389:cd38? ([2607:fea8:fc01:8d8d:5c3d:ce6:f389:cd38])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4fe70a277sm12416546d6.55.2025.04.30.13.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 13:30:53 -0700 (PDT)
Message-ID: <53a26378fce90c8bbfa57a582992324560aa0274.camel@redhat.com>
Subject: Re: [PATCH v3 0/4] KVM: lockdep improvements
From: mlevitsk@redhat.com
To: kvm@vger.kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Randy Dunlap
 <rdunlap@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, Will Deacon
 <will@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, Kunkun Jiang
 <jiangkunkun@huawei.com>, Jing Zhang <jingzhangos@google.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Keisuke Nishimura <keisuke.nishimura@inria.fr>, 
 Anup Patel <anup@brainfault.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Atish Patra <atishp@atishpatra.org>,
 kvmarm@lists.linux.dev, Waiman Long <longman@redhat.com>,  Boqun Feng
 <boqun.feng@gmail.com>, linux-arm-kernel@lists.infradead.org, Peter
 Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Sebastian Ott
 <sebott@redhat.com>, Andre Przywara <andre.przywara@arm.com>, Ingo Molnar
 <mingo@redhat.com>, Alexandre Ghiti <alex@ghiti.fr>, Bjorn Helgaas
 <bhelgaas@google.com>, Palmer Dabbelt <palmer@dabbelt.com>, Joey Gouly
 <joey.gouly@arm.com>, Borislav Petkov <bp@alien8.de>, Sean Christopherson
 <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Alexander Potapenko
 <glider@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org, Shusen Li
 <lishusen2@huawei.com>,  kvm-riscv@lists.infradead.org
Date: Wed, 30 Apr 2025 16:30:51 -0400
In-Reply-To: <20250430202311.364641-1-mlevitsk@redhat.com>
References: <20250430202311.364641-1-mlevitsk@redhat.com>
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mKDzoyZ_Ey0eLWwcF-LNypyzfBhd21jpMUUeK4FOcJ0_1746045055
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_213059_969724_00F60F08 
X-CRM114-Status: GOOD (  15.53  )
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

T24gV2VkLCAyMDI1LTA0LTMwIGF0IDE2OjIzIC0wNDAwLCBNYXhpbSBMZXZpdHNreSB3cm90ZToK
PiBUaGlzIGlzCWEgY29udGludWF0aW9uIG9mIG15ICdleHRyYWN0Cj4gbG9ja19hbGxfdmNwdXMv
dW5sb2NrX2FsbF92Y3B1cycKPiBwYXRjaCBzZXJpZXMuCj4gCj4gSW1wbGVtZW50IHRoZSBzdWdn
ZXN0aW9uIG9mIHVzaW5nIGxvY2tkZXAncyAibmVzdF9sb2NrIiBmZWF0dXJlCj4gd2hlbiBsb2Nr
aW5nIGFsbCBLVk0gdkNQVXMgYnkgYWRkaW5nIG11dGV4X3RyeWxvY2tfbmVzdF9sb2NrKCkgYW5k
Cj4gbXV0ZXhfbG9ja19raWxsYWJsZV9uZXN0X2xvY2soKSBhbmQgdXNlIHRoZXNlIGZ1bmN0aW9u
cwlpbiB0aGUKPiBpbXBsZW1lbnRhdGlvbiBvZiB0aGUKPiBrdm1fdHJ5bG9ja19hbGxfdmNwdXMo
KS9rdm1fbG9ja19hbGxfdmNwdXMoKS9rdm1fdW5sb2NrX2FsbF92Y3B1cygpLgo+IAo+IFRob3Nl
IGNoYW5nZXMgYWxsb3cgcmVtb3ZhbCBvZiBhIGN1c3RvbSB3b3JrYXJvdW5kIHRoYXQgd2FzIG5l
ZWRlZCB0bwo+IHNpbGVuY2UgdGhlIGxvY2tkZXAgd2FybmluZyBpbiB0aGUgU0VWIGNvZGUgYW5k
IGFsc28gc3RvcCBsb2NrZGVwCj4gZnJvbQo+IGNvbXBsYWluaW5nIGluIGNhc2Ugb2YgQVJNIGFu
ZCBSSVNDLVYgY29kZSB3aGljaCBkb2Vzbid0IGluY2x1ZGUgdGhlCj4gYWJvdmUKPiBtZW50aW9u
ZWQgd29ya2Fyb3VuZC4KPiAKPiBGaW5hbGx5LCBpdCdzIHdvcnRoIG5vdGluZyB0aGF0IHRoaXMg
cGF0Y2ggc2VyaWVzIHJlbW92ZXMgYSBmYWlyCj4gYW1vdW50IG9mIGR1cGxpY2F0ZSBjb2RlIGJ5
IGltcGxlbWVudGluZyB0aGUgbG9naWMgaW4gb25lIHBsYWNlLgo+IAo+IEJlc3QgcmVnYXJkcywK
PiAJTWF4aW0gTGV2aXRza3kKPiAKPiBNYXhpbSBMZXZpdHNreSAoNCk6Cj4gwqAgYXJtNjQ6IEtW
TTogdXNlIG11dGV4X3RyeWxvY2tfbmVzdF9sb2NrIHdoZW4gbG9ja2luZyBhbGwgdkNQVXMKPiDC
oCBSSVNDLVY6IEtWTTogc3dpdGNoIHRvIGt2bV9sb2NrL3VubG9ja19hbGxfdmNwdXMKPiDCoCBs
b2NraW5nL211dGV4OiBpbXBsZW1lbnQgbXV0ZXhfbG9ja19raWxsYWJsZV9uZXN0X2xvY2sKPiDC
oCB4ODY6IEtWTTogU0VWOiBpbXBsZW1lbnQga3ZtX2xvY2tfYWxsX3ZjcHVzIGFuZCB1c2UgaXQK
PiAKPiDCoGFyY2gvYXJtNjQvaW5jbHVkZS9hc20va3ZtX2hvc3QuaMKgwqDCoMKgIHzCoCAzIC0t
Cj4gwqBhcmNoL2FybTY0L2t2bS9hcmNoX3RpbWVyLmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAg
NCArLQo+IMKgYXJjaC9hcm02NC9rdm0vYXJtLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHwgNDMgLS0tLS0tLS0tLS0tLS0tLQo+IMKgYXJjaC9hcm02NC9rdm0vdmdpYy92Z2lj
LWluaXQuY8KgwqDCoMKgwqDCoCB8wqAgNCArLQo+IMKgYXJjaC9hcm02NC9rdm0vdmdpYy92Z2lj
LWl0cy5jwqDCoMKgwqDCoMKgwqAgfMKgIDggKy0tCj4gwqBhcmNoL2FybTY0L2t2bS92Z2ljL3Zn
aWMta3ZtLWRldmljZS5jIHwgMTIgKystLS0KPiDCoGFyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2Uu
Y8KgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMzQgKy0tLS0tLS0tLS0tLQo+IMKgYXJjaC94ODYva3Zt
L3N2bS9zZXYuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDcyICsrLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPiAtLQo+IMKgaW5jbHVkZS9saW51eC9rdm1faG9zdC5owqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgIDQgKysKPiDCoGluY2x1ZGUvbGludXgvbXV0ZXguaMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTcgKysrKystLQo+IMKga2VybmVsL2xvY2tp
bmcvbXV0ZXguY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNyArLS0KPiDCoHZp
cnQva3ZtL2t2bV9tYWluLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA1
OSArKysrKysrKysrKysrKysrKysrKysrCj4gwqAxMiBmaWxlcyBjaGFuZ2VkLCAxMDAgaW5zZXJ0
aW9ucygrKSwgMTY3IGRlbGV0aW9ucygtKQo+IAo+IC0tIAo+IDIuNDYuMAo+IAo+IAoKCkkgZm9y
Z290IHRvIHNlbmQgZmlyc3QgcGF0Y2ggaW4gdGhlIHNlcmllcywgcmVzZW5kaW5nLgoKQmVzdCBy
ZWdhcmRzLAoJTWF4aW0gTGV2aXRza3kKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0t
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
