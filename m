Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F83E7716C
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 06:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8/V1SWHi7ImPwWpffjD+qpQxOjAL32h/gvxTdSO6Q1Q=; b=u1gpkIVcJVtlHS
	F004l0O5/7kiKrx9eJVhNr8MYD+zD6xoyDtMO8KB3Pybg0u0iNUgu3Pw6p1sun+oSkejfsrNLMlfg
	Vkcdq582fRmVvSQ+CU/DnqqO6j9NIv1aiSfE+kTRQjqUPKbdIUEBzMB8aYglJP8zG8MjPLmvB/F2B
	fUWzBF3CMRh8sJ2CK7D7Lmcht6sfuUA8ua0+5OCwEyLGSPFbOPn4NXK4TcApR9BkqL+zKDgQ2XlWE
	yJ07qUz61eAkt0wODPgOhxbb1s6HBQqiYLUBlrcF6czg8U20IH+cvJdAPtWkN2//Vn1U6Roocgdmv
	3UzFt1m62so4KoTvsX9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ53L-0000000Erep-42Vf;
	Thu, 05 Dec 2024 06:09:31 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ53J-0000000ErdV-00Ds
	for kvm-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 06:09:30 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-84198253240so20082839f.0
        for <kvm-riscv@lists.infradead.org>; Wed, 04 Dec 2024 22:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1733378968; x=1733983768; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aL2ODb59ZMLyvYZNKyPV9w4ocXZc2/Drlrpw4dYUQ6s=;
        b=LwTangLmsC7orkr5Jh8zleHqRtjPd5hRLZ6X8Q1rJj7sXzbNk9rFuPRK8kPzby8xIc
         LBIGJtvli3kgnOJuVdk0IDXR6E6N5x+b0oahJIRVuM6hQ1WPnx0OmZKM9X1BEzIea+jH
         8aPeYhMEGkTGq0/NQnvnOL53uDYM/dihhTipmyWhxVo/uZSlW2JpU7BShE6eq7a3FOqh
         nYzxuVH5UefAYVqswFJZ1F/BiZxDrWCXEijCnYfPDSQ0xMdR1gLLrVcJqdfOpvnDS+Yi
         LYKMCPIEolB3rueUTBRzBhqk1Ni5NZ2Ct2EwkPnMxSEfcPkDDgusQD7CkpYd+fmX4i9J
         pluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733378968; x=1733983768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aL2ODb59ZMLyvYZNKyPV9w4ocXZc2/Drlrpw4dYUQ6s=;
        b=ux1hmOxJC3wsPrBuBrQwHrtF26YucS7hIs5TuaH0ieVMhOjH5VKbJJ0/QgoWnYdDUg
         cEg53MucqcH8gdWL9PFEl492I10wXExDsh3jGWqUTZMo5Nf3JmyU0W3KdPvVeo9afdph
         IOVAddd87VPguqaMXU3txtxPwzU09OItTLZEJOwoK2bp9FB9YT8WRfuh9ajdqxREOfp9
         vHE6RnJnOif56qN18Li10lCLj26S50IuCmWxhl4cKSJBXcSM6xuSixrHcgzFxFslXPXr
         FwGpkWw3W8xiZtEvOI5gtIZzadLD7UTLu4yjOcSgfySX7/NL8QPalaPzGNggU//GoDOL
         bpdw==
X-Forwarded-Encrypted: i=1; AJvYcCVPPQR3nnKf+jBOF/9o1wjuFdxpo4WFlYOwpy25mgx8b4FkV0ylPw5vrkLIWbKsqY/eOTGSsND2aHI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxUHu81GSYBzIseYNcg1uvlB25faZ86W9xIK2bfHDVMepPK+EUl
	6O4raR8Md35koi5rZgfRLkCBo8qUqrQv/BMzKRQdNmQ90mW+nJYfY9244V+fLxDTtVfZhv+rtYV
	2vNkE6N7X4tlmWZdvuvyXMt9FTUc56/D9pIPVqw==
X-Gm-Gg: ASbGncv3jzrhL0P4fwR5nLJJ9ZVayvLHI+1RpSe2hcyRC23OnmRonq+0YAb62q2WirL
	G4ouURcTRKMvfSiJxxD8O0MamW81AAQ==
X-Google-Smtp-Source: AGHT+IEOJFcAi0n4c1mbGRpzcMhoQOlyi+pjiyaxzgnJjkOrtltLnY8I/trZOofEuFvj7Y58FOr5LXqv2HOUgAuNT5U=
X-Received: by 2002:a05:6602:160b:b0:83a:7a19:1de0 with SMTP id
 ca18e2360f4ac-8445b5e5949mr1404993539f.14.1733378967761; Wed, 04 Dec 2024
 22:09:27 -0800 (PST)
MIME-Version: 1.0
References: <cover.1732854096.git.zhouquan@iscas.ac.cn>
In-Reply-To: <cover.1732854096.git.zhouquan@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 5 Dec 2024 11:39:16 +0530
Message-ID: <CAAhSdy2aPmV6U+GnCnqExXzO3okpDFTbCgwz+Y=dZDVBO0E7Eg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] RISC-V: KVM: Allow Svvptc/Zabha/Ziccrse exts for guests
To: zhouquan@iscas.ac.cn
Cc: ajones@ventanamicro.com, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_220929_030368_A360B25F 
X-CRM114-Status: UNSURE (   9.85  )
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

T24gTW9uLCBEZWMgMiwgMjAyNCBhdCA4OjUz4oCvQU0gPHpob3VxdWFuQGlzY2FzLmFjLmNuPiB3
cm90ZToKPgo+IEZyb206IFF1YW4gWmhvdSA8emhvdXF1YW5AaXNjYXMuYWMuY24+Cj4KPiBBZHZl
cnRpc2UgU3Z2cHRjL1phYmhhL1ppY2Nyc2UgZXh0ZW5zaW9ucyB0byBLVk0gZ3Vlc3QKPiB3aGVu
IHVuZGVybHlpbmcgaG9zdCBzdXBwb3J0cyBpdC4KPgo+IC0tLQo+IENoYW5nZSBzaW5jZSB2MToK
PiAtIEFycmFuZ2UgU3Z2cHRjIGluIGFscGhhYmV0aWNhbCBvcmRlciAoQW5kcmV3KQo+IC0gQWRk
IFJldmlld2VkLWJ5IHRhZ3MKPgo+IC0tLQo+IHYxIGxpbms6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsL2NvdmVyLjE3MzI3NjIxMjEuZ2l0Lnpob3VxdWFuQGlzY2FzLmFjLmNuLwo+Cj4g
UXVhbiBaaG91ICg0KToKPiAgIFJJU0MtVjogS1ZNOiBBbGxvdyBTdnZwdGMgZXh0ZW5zaW9uIGZv
ciBHdWVzdC9WTQo+ICAgUklTQy1WOiBLVk06IEFsbG93IFphYmhhIGV4dGVuc2lvbiBmb3IgR3Vl
c3QvVk0KPiAgIFJJU0MtVjogS1ZNOiBBbGxvdyBaaWNjcnNlIGV4dGVuc2lvbiBmb3IgR3Vlc3Qv
Vk0KPiAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIFN2dnB0Yy9aYWJoYS9aaWNjcnNlIGV4
dHMgdG8gZ2V0LXJlZy1saXN0Cj4gICAgIHRlc3QKClF1ZXVlZCB0aGlzIHNlcmllcyBmb3IgNi4x
NAoKVGhhbmtzLApBbnVwCgo+Cj4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCAg
ICAgICAgICAgICAgICB8ICAzICsrKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jICAg
ICAgICAgICAgICAgICAgICAgfCAgNiArKysrKysKPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
a3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jIHwgMTIgKysrKysrKysrKysrCj4gIDMgZmlsZXMgY2hh
bmdlZCwgMjEgaW5zZXJ0aW9ucygrKQo+Cj4gLS0KPiAyLjM0LjEKPgoKLS0gCmt2bS1yaXNjdiBt
YWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
