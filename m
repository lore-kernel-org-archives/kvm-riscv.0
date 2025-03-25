Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C214C36008
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 19:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=REIRPH7iml+WGb9f9tLp6H/lrhgtZnaP2qW+pAmXRCU=; b=cLlGRGmOXhTxt9
	vGm9OHpwtIKUCFV469gMtWXNZslgraG/mmGIbKbqOJN22Ya/tRYbyFb+LXAqywWPWMghbVwjGPH88
	Z8zfAyJ/wOFDUA9cuIHqafrDHlRdU1dibn1ai+X/PskVOpWK2oLZQ20qFFNYxhbrfQKS8cyw11rvT
	OupfvVbp296mwRyG2SpoikyZEqbGEk3d9gWWUAKwnlr1VLfb2KXgIwd9NKDFsaxwEL5pIjHlxIQ9U
	eBbW2/YWTMGA7nMK5vzobDZ+Duh2Vcc84uI0V7xK65A41p5Lh+PddbcYXNFykAVZ9d6pj9DiVy88Y
	s6uhsyKzOE8mlBKZ+sLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx9hR-00000006pRa-0FTS;
	Tue, 25 Mar 2025 19:12:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx9NT-00000006ltW-2TVA
	for kvm-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 18:51:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742928714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=t8j8FcQOo2vXT0+x/EC8FM0KhlfrmjmrMAU0Mg5SiOs=;
	b=RqxGw/S6v1nIdrI4nFDuvbHCfj2umR3oKVT4LXMadNbppkkSzFhEw+twemQbEzsi6xRBK6
	3mfzn0XM9Qlgdzuf0TQbyw7UZB4Vwe8umpJe6Gdz0NElCda/LhjU6a0RXNejAvairk/BAT
	62tk2qQX6FWeSCPLbtRHKVuZ1/tonhs=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-yGPJTAznPgaXnV01acMkpA-1; Tue, 25 Mar 2025 14:51:52 -0400
X-MC-Unique: yGPJTAznPgaXnV01acMkpA-1
X-Mimecast-MFC-AGG-ID: yGPJTAznPgaXnV01acMkpA_1742928711
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e90788e2a7so2236046d6.0
        for <kvm-riscv@lists.infradead.org>; Tue, 25 Mar 2025 11:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742928711; x=1743533511;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t8j8FcQOo2vXT0+x/EC8FM0KhlfrmjmrMAU0Mg5SiOs=;
        b=H7b9ZLZI0SSm1ci3g45vvaJSFDpw7vM79y4e+3o44fzqh+2JyR8VAEPLrd+pkYCqXN
         3lR86SwP6wKFsTvPQYB0LhKbqTao+AW6DVNNqSXROGRo4TeyFggjo/KLkCScbhdLbLnV
         eJyM/aG+we7nrmSfSZ4dNh/iyohItz+SPofXNSAcjaOgxGvRpDlGoAraZ6FVbtvtMUdW
         MFzEx8hzrC+2WqYOHtALwyBpZMa53ggp+0/cNBMmyo938L7zrAkrftNQRjBj3/UaLaE0
         qOaa+tm9zMFo309LeN83YjaEOcN4tEQrqqWYd2pEZGo4gjEpCBNBGkuuR/ZT//A75mY3
         zs8w==
X-Forwarded-Encrypted: i=1; AJvYcCXrT6mVNF27X/FXuRVdVIC6N7Rtzr65rpKdJQ3INhZTBKkBAjgoynhQLVSZ22IkHADrhsgOglALfSc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc3aBV3imCxq1jbrKeejwk574U/uWI8ceBce1QUQyA674BTMtR
	mxcLKFHipVoxJiln4FTk/fp/k4nPHcYn5l97g8ymYWooA9+1JIFT6N6tNcJrrqIi4AH6AnM4C7c
	/NpZa3j/1ql8aXDDmOXVG2RirNAbOiMsH1XzEbXN3bFcZ+J8yKUOmZK7kW8EH2E8=
X-Gm-Gg: ASbGncvsWwnV1vn+YmZghMZBxr2n6gH25tzBJ97qEVhL8Gu6zltB/4F++inJsO44PiL
	TO6qqcmNHnmoq2z9P9AH+hQBlNqmrlNrz9uvgX81AcdnJO75su3LFRIrFQzb0w8yJ3ZzOwTu+2c
	Nm57b6z4scpIO59ejV9KZCpZ8YvK3D0Tau7DpOXxoZHYER6g/cZwGv0p26CeTbgsTHKZuPMfKm+
	AKQbcwu043/ewGtSdrSrQcKGV1xaQ6nlY4luH8XAZwCzrz3nm3QK0BmfFS1OHcCP9x4BnxJu6zu
	qmvTwq4tVB3B
X-Received: by 2002:a0c:eb46:0:b0:6ea:d503:6cfd with SMTP id 6a1803df08f44-6ed16cde3f6mr12230386d6.19.1742928711422;
        Tue, 25 Mar 2025 11:51:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqYQjFn4K1j4fuehDL2vDnCV4xeKoEsPSC3k3g7nw2h2mfdx1DkNTmzNbOxS9v9bBBC08uag==
X-Received: by 2002:a0c:eb46:0:b0:6ea:d503:6cfd with SMTP id 6a1803df08f44-6ed16cde3f6mr12229966d6.19.1742928710955;
        Tue, 25 Mar 2025 11:51:50 -0700 (PDT)
Received: from [172.20.3.205] ([99.209.85.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eb3efc5952sm58924306d6.83.2025.03.25.11.51.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 11:51:50 -0700 (PDT)
Message-ID: <0e1d8823-620f-420c-86a5-35495ccbd10f@redhat.com>
Date: Tue, 25 Mar 2025 19:51:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH V3 00/43] rv64ilp32_abi: Build CONFIG_64BIT
 kernel-self with ILP32 ABI
To: Peter Zijlstra <peterz@infradead.org>, guoren@kernel.org
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, torvalds@linux-foundation.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, anup@brainfault.org,
 atishp@atishpatra.org, oleg@redhat.com, kees@kernel.org, tglx@linutronix.de,
 will@kernel.org, mark.rutland@arm.com, brauner@kernel.org,
 akpm@linux-foundation.org, rostedt@goodmis.org, edumazet@google.com,
 unicorn_wang@outlook.com, inochiama@outlook.com, gaohan@iscas.ac.cn,
 shihua@iscas.ac.cn, jiawei@iscas.ac.cn, wuwei2016@iscas.ac.cn,
 drew@pdp7.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 ctsai390@andestech.com, wefu@redhat.com, kuba@kernel.org, pabeni@redhat.com,
 josef@toxicpanda.com, dsterba@suse.com, mingo@redhat.com,
 boqun.feng@gmail.com, xiao.w.wang@intel.com, qingfang.deng@siflower.com.cn,
 leobras@redhat.com, jszhang@kernel.org, conor.dooley@microchip.com,
 samuel.holland@sifive.com, yongxuan.wang@sifive.com,
 luxu.kernel@bytedance.com, ruanjinjie@huawei.com, cuiyunhui@bytedance.com,
 wangkefeng.wang@huawei.com, qiaozhe@iscas.ac.cn, ardb@kernel.org,
 ast@kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-mm@kvack.org,
 linux-crypto@vger.kernel.org, bpf@vger.kernel.org,
 linux-input@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-arch@vger.kernel.org, maple-tree@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-atm-general@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 linux-nfs@vger.kernel.org, linux-sctp@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-media@vger.kernel.org
References: <20250325121624.523258-1-guoren@kernel.org>
 <20250325122640.GK36322@noisy.programming.kicks-ass.net>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250325122640.GK36322@noisy.programming.kicks-ass.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 08OYjQNORBwQZCq-wLOegbO07AvkkUz_UgcEEsLwkhE_1742928711
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_115155_689907_968C3027 
X-CRM114-Status: GOOD (  11.84  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On 25.03.25 13:26, Peter Zijlstra wrote:
> On Tue, Mar 25, 2025 at 08:15:41AM -0400, guoren@kernel.org wrote:
>> From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>
>>
>> Since 2001, the CONFIG_64BIT kernel has been built with the LP64 ABI,
>> but this patchset allows the CONFIG_64BIT kernel to use an ILP32 ABI
> 
> I'm thinking you're going to be finding a metric ton of assumptions
> about 'unsigned long' being 64bit when 64BIT=y throughout the kernel.
> 
> I know of a couple of places where 64BIT will result in different math
> such that a 32bit 'unsigned long' will trivially overflow.
> 
> Please, don't do this. This adds a significant maintenance burden on all
> of us.
> 

Fully agreed.

-- 
Cheers,

David / dhildenb


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
